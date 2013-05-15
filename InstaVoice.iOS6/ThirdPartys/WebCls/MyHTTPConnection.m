#import "MyHTTPConnection.h"
#import "MyHTTPServer.h"
#import "MyWebSocket.h"
#import "HTTPResponse.h"
#import "UtilityManager.h"


@implementation MyHTTPConnection


- (NSData*)sendRedirect
{
	DLog(@"Sending redirect");
	
	// Status Code 302 - Temporal redirect
	CFHTTPMessageRef response = CFHTTPMessageCreateResponse(kCFAllocatorDefault, 301, NULL, kCFHTTPVersion1_1);
	CFHTTPMessageSetHeaderFieldValue(response, CFSTR("Location"), CFSTR("/index.html"));
    
    NSString *msg = @"<script>document.location='/index.html';</script>";
	NSData *msgData = [msg dataUsingEncoding:NSUTF8StringEncoding];
	   
	CFHTTPMessageSetBody(response, (CFDataRef)msgData);
	   
	NSString *contentLengthStr = [NSString stringWithFormat:@"%lu", (unsigned long)[msgData length]];
	CFHTTPMessageSetHeaderFieldValue(response, CFSTR("Content-Length"), (CFStringRef)contentLengthStr);
	CFHTTPMessageSetHeaderFieldValue(response, CFSTR("Content-Type"), CFSTR("text/html"));
	
	NSData* responseData = [super preprocessResponse:response];
	CFRelease(response);
    return responseData;
}


- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path
{
    
    /*  Igor Antonov
     *  Custom <filter> implementation to handle asset download and actions (like delete, delete-all, etc). 
     *  First we test the path to match the regular expression, if positive - apply actions and forward the request
     */
    
    NSString* newPath = path;
    
    NSError *error = NULL;
    NSRegularExpression *fileActionRegexRegex = [NSRegularExpression regularExpressionWithPattern:@"/(.+)\\?((?:m4a)|(?:txt)|(?:zip)|(?:all)|(?:del))"
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSTextCheckingResult *match = [fileActionRegexRegex firstMatchInString:path
                                                    options:0
                                                      range:NSMakeRange(0, [path length])];
    if (match) {
        NSString *strFileNamePrefix = [path substringWithRange:[match rangeAtIndex:1]];
        NSString *strAction = [path substringWithRange:[match rangeAtIndex:2]];
        
        NSFileManager* manager = [NSFileManager defaultManager];
        
        if([strAction isEqualToString:@"m4a"] || [strAction isEqualToString:@"txt"]) {    // Straight file download
            newPath = [NSString stringWithFormat:@"%@.%@",strFileNamePrefix ,strAction];
            [manager copyItemAtPath:[RECORDINGS_FOLDER stringByAppendingPathComponent:newPath] toPath:[WEB_FOLDER stringByAppendingPathComponent:newPath] error:nil];
        } else if([strAction isEqualToString:@"del"] || [strAction isEqualToString:@"zip"]) {
            if([strAction isEqualToString:@"del"]) {
                [UtilityManager deleteRecordingObject:strFileNamePrefix];
                [UtilityManager updateIndexPage];
                newPath = @"/redirect.html";
                //NSData* data = [self sendRedirect];
                //return [[[HTTPDataResponse alloc] initWithData:data] autorelease];
            } else if([strAction isEqualToString:@"zip"]) {
                [UtilityManager createZipForRecording:strFileNamePrefix];
                newPath = [NSString stringWithFormat:@"%@.%@",strFileNamePrefix ,@"zip"];
            }
        }
    } else if([path isEqualToString:@"/delete-all"]) {
        [UtilityManager deleteAllRecordings];
        [UtilityManager updateIndexPage];
        newPath = @"/redirect.html";
    } else if([path isEqualToString:@"/zip-all"]) {
        newPath = [UtilityManager createZipForAllRecordings:@"InstaVoice-all"];
        method = @"HEAD";
    } else if([path isEqualToString:@"/service"]) {
		// Request:
		// 
		// GET /service HTTP/1.1
		// Upgrade: WebSocket
		// Connection: Upgrade
		// Host: localhost:kSharePort
		// Origin: http://localhost:kSharePort
		
		isWebSocketRequest = YES;
		
		// Return an empty response.
		// This will let the HTTPConnection handle most of the normal HTTP response stuff.
		return [[[HTTPDataResponse alloc] initWithData:nil] autorelease];
	}
    
	return [super httpResponseForMethod:method URI:newPath];
}

- (NSData *)preprocessResponse:(CFHTTPMessageRef)response
{
	if(isWebSocketRequest)
	{
		// Response:
		// 
		// HTTP/1.1 101 Web Socket Protocol Handshake
		// Upgrade: WebSocket
		// Connection: Upgrade
		// WebSocket-Origin: http://localhost:kSharePort
		// WebSocket-Location: ws://localhost:kSharePort/service
		
		CFHTTPMessageRef wsResponse = CFHTTPMessageCreateResponse(kCFAllocatorDefault,
		                                                          101, CFSTR("Web Socket Protocol Handshake"),
		                                                          kCFHTTPVersion1_1);
		
		CFHTTPMessageSetHeaderFieldValue(wsResponse, CFSTR("Upgrade"), CFSTR("WebSocket"));
		CFHTTPMessageSetHeaderFieldValue(wsResponse, CFSTR("Connection"), CFSTR("Upgrade"));
		
		// Note: It appears that WebSocket-Origin and WebSocket-Location
		// are required for Google's Chrome implementation to work properly.
		// 
		// If we don't send either header, Chrome will never report the WebSocket as open.
		// If we only send one of the two, Chrome will immediately close the WebSocket.
		// 
		// In addition to this it appears that Chrome's implementation is very picky of the values of the headers.
		// They have to match exactly with what Chrome sent us or it will close the WebSocket.
		
		NSString *wsOrigin = NSMakeCollectable(CFHTTPMessageCopyHeaderFieldValue(request, CFSTR("Origin")));
		if (wsOrigin == nil)
		{
			wsOrigin = [NSString stringWithFormat:@"http://localhost:%d", kSharePort];
		}
		
		NSString *wsLocation;
		NSString *wsHost = NSMakeCollectable(CFHTTPMessageCopyHeaderFieldValue(request, CFSTR("Host")));
		if (wsHost == nil)
		{
			wsLocation =  [NSString stringWithFormat:@"ws://localhost:%d/service", kSharePort];
		}
		else
		{
			wsLocation = [NSString stringWithFormat:@"ws://%@/service", wsHost];
		}
		
		CFHTTPMessageSetHeaderFieldValue(wsResponse, CFSTR("WebSocket-Origin"), (CFStringRef)wsOrigin);
		CFHTTPMessageSetHeaderFieldValue(wsResponse, CFSTR("WebSocket-Location"), (CFStringRef)wsLocation);
		
		[wsOrigin release];
		[wsHost release];
						  
		// Do not invoke super.
		// The above headers are all that is required for a WebSocket.
		
		NSData *result = NSMakeCollectable(CFHTTPMessageCopySerializedMessage(wsResponse));
		
		NSString *tempStr = [[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding] autorelease];
		DLog(@"WebSocket Response:\n%@", tempStr);
		
		return [result autorelease];
	}
	else
	{
		return [super preprocessResponse:response];
	}
}

- (BOOL)shouldDie
{
	if (isWebSocketRequest)
	{
		// Create our web socket
		MyWebSocket *ws = [[[MyWebSocket alloc] initWithSocket:asyncSocket] autorelease];
		
		// Add the web socket to the server's list (so that it's retained somewhere)
		MyHTTPServer *myServer = (MyHTTPServer *)server;
		[myServer addWebSocket:ws];
		
		// The WebSocket now has ownership of the underlying socket.
		// So remove the HTTPConnection's reference to it.
		[asyncSocket release];
		asyncSocket = nil;
		
		return YES;
	}
	else
	{
		return [super shouldDie];
	}
}

@end
