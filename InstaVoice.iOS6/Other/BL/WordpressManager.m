//
//  WordpressManager.m
//  iJott
//
//  Created by pda.developer@gmail.com on 5/23/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "WordpressManager.h"
#import "XMLRPCRequest.h"
#import "ASIHTTPRequest.h"
#import "XMLRPCResponse.h"

@implementation WordpressManager
@synthesize username;
@synthesize password;
@synthesize idValue;
@synthesize xmlRPC;
@synthesize error;

static WordpressManager* _manager;
+(WordpressManager*) sharedManager
{
	if (_manager == nil)
		_manager = [[WordpressManager alloc] init];
	return _manager;
}

-(void) dealloc
{
	[error release];
	[super dealloc];
}
#pragma mark Functions
-(void) loadSettings
{
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	self.username = [defaults objectForKey:@"wp_username"];
	self.password = [defaults objectForKey:@"wp_password"];
	self.idValue = [defaults objectForKey:@"wp_idValue"];
	self.xmlRPC = [defaults objectForKey:@"wp_xmlRPC"];
}

-(void) saveSettings
{
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:self.username forKey:@"wp_username"];
	[defaults setObject:self.password forKey:@"wp_password"];
	[defaults setObject:self.idValue forKey:@"wp_idValue"];
	[defaults setObject:self.xmlRPC forKey:@"wp_xmlRPC"];
	[defaults synchronize];
}

-(bool) login:(NSString*) _username password:(NSString*) _password
{
	XMLRPCRequest *xmlrpcUsersBlogs = [[XMLRPCRequest alloc] initWithHost:[NSURL URLWithString:@"https://wordpress.com/xmlrpc.php"]];
	[xmlrpcUsersBlogs setMethod:@"wp.getUsersBlogs" withObjects:[NSArray arrayWithObjects:_username, _password, nil]];
	DLog(@"parameters = %@", [NSArray arrayWithObjects:_username, _password, nil]);
	NSArray *usersBlogsData = [self executeXMLRPCRequest:xmlrpcUsersBlogs];
		//	DLog(@"Count = %d" , [usersBlogsData count]);
	if ([usersBlogsData isKindOfClass:[NSArray class]])
	{
		self.username = _username;
		self.password = _password;
		
		
		NSArray* blogName = [usersBlogsData valueForKey:@"blogName"];
		if ([blogName isKindOfClass:[NSArray class]] && [blogName count] > 0)
		{
				//DLog(@"blog value = %@", [blogName objectAtIndex:0]);
		}
		
		NSArray* blogid = [usersBlogsData valueForKey:@"blogid"];
		if ([blogid isKindOfClass:[NSArray class]] && [blogid count] > 0)
		{
				//DLog(@"blog value = %@", [blogid objectAtIndex:0]);
			self.idValue = [blogid objectAtIndex:0];
		}
		
		NSArray* url = [usersBlogsData valueForKey:@"url"];
		if ([url isKindOfClass:[NSArray class]] && [url count] > 0)
		{
				//DLog(@"blog value = %@", [url objectAtIndex:0]);
		}
		
		NSArray* xmlrpc = [usersBlogsData valueForKey:@"xmlrpc"];
		if ([xmlrpc isKindOfClass:[NSArray class]] && [xmlrpc count] > 0)
		{
				//DLog(@"blog value = %@", [xmlrpc objectAtIndex:0]);
			self.xmlRPC = [xmlrpc objectAtIndex:0];
		}
		
			//DLog(@"blog count = %d", [blogName count]);
		return true;
		
	}
	[xmlrpcUsersBlogs release];
	return false;
}

-(void) post:(NSString*) title message:(NSString*) message
{
	XMLRPCRequest *xmlrpcRequest = [[XMLRPCRequest alloc] initWithHost:[NSURL URLWithString:self.xmlRPC]];

	DLog(@"posting on %@", self.xmlRPC);
	
	NSMutableDictionary *postParams = [NSMutableDictionary dictionary];
		[postParams setObject:title forKey:@"title"];
		[postParams setObject:message forKey:@"description"];
		[postParams setObject:@"publish" forKey:@"post_status"];
	
	DLog(@"Dictionary1 = %@", postParams);
	
	NSMutableArray *result = [NSMutableArray array];
	[result addObject:self.idValue];
	[result addObject:self.username];
	[result addObject:self.password];
	if (postParams != nil) {
		[result addObjectsFromArray:[NSArray arrayWithObject:postParams]];
	}
	
	NSArray* ar =  [NSArray arrayWithArray:result];
	
	DLog(@"array = %@", ar);
	[xmlrpcRequest setMethod:@"metaWeblog.newPost" withObjects:ar];
	id result2 = [self executeXMLRPCRequest:xmlrpcRequest];
	DLog(@"result = %@", result2);
}

#pragma mark Wordpress Methods

- (id)executeXMLRPCRequest:(XMLRPCRequest *)req {
	ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:[req host]];
	[request setRequestMethod:@"POST"];
	[request setShouldPresentCredentialsBeforeChallenge:YES];
	[request setShouldPresentAuthenticationDialog:YES];
	[request setUseKeychainPersistence:YES];
    [request setValidatesSecureCertificate:NO];
	[request setTimeOutSeconds:30];
	NSString *version  = [[[NSBundle mainBundle] infoDictionary] valueForKey:[NSString stringWithFormat:@"CFBundleVersion"]];
	[request addRequestHeader:@"User-Agent" value:[NSString stringWithFormat:@"wp-iphone/%@",version]];
	
    NSString *quickPostType = [[req request] valueForHTTPHeaderField:@"WP-Quick-Post"];
    if (quickPostType != nil) {
        [request addRequestHeader:@"WP-Quick-Post" value:quickPostType];
    }
	
    if (true) {
        [request setNumberOfTimesToRetryOnTimeout:2];
    } else {
        [request setNumberOfTimesToRetryOnTimeout:0];
    }
	if(getenv("WPDebugXMLRPC"))
		DLog(@"executeXMLRPCRequest request: %@",[req source]);
    [request appendPostData:[[req source] dataUsingEncoding:NSUTF8StringEncoding]];
	[request startSynchronous];
	
		//generic error
	NSError *err = [request error];
    if (err) {
        self.error = err;
        DLog(@"executeXMLRPCRequest error: %@", err);
		[request release];
        return err;
    }
    
    
    int statusCode = [request responseStatusCode];
    if (statusCode >= 404) {
        NSDictionary *usrInfo = [NSDictionary dictionaryWithObjectsAndKeys:[request responseStatusMessage], NSLocalizedDescriptionKey, nil];
        self.error = [NSError errorWithDomain:@"org.wordpress.iphone" code:statusCode userInfo:usrInfo];
		[request release];
        return self.error;
    }
	if(getenv("WPDebugXMLRPC"))
		DLog(@"executeXMLRPCRequest response: %@", [request responseString]);
	
	
	
		//get rid of weird characters before the xml preamble
	int responseLenght = [[request responseString] length];
		//NSLog (@"String length is %i", responseLenght);
	int charIndex = 0;
	
	for( ; charIndex < responseLenght; charIndex++) {
		unichar testChar = [[request responseString] characterAtIndex:charIndex];
		if(testChar == 60) {
				//NSLog (@"found the correct start char at index %i", charIndex);
			break;
		} else {
				//NSLog (@"invalid response char at index %i", charIndex );
		}
	} //end for
	
	
	NSRange prefixRange;
	if(charIndex != 0) {
		NSString *cleanedStr = [[request responseString] substringFromIndex: charIndex];
		prefixRange = [[cleanedStr stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]] rangeOfString:@"<?xml"
																											   options:(NSAnchoredSearch | NSCaseInsensitiveSearch)];		
	} else {		
		prefixRange = [[[request responseString] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]] rangeOfString:@"<?xml"
																															 options:(NSAnchoredSearch | NSCaseInsensitiveSearch)];		
	}
    if (prefixRange.location == NSNotFound) {
			// Not an xml document, don't parse
        
        NSDictionary *usrInfo = [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Blog returned invalid data.", @""), NSLocalizedDescriptionKey, nil];
        self.error = [NSError errorWithDomain:@"org.wordpress.iphone" code:903 userInfo:usrInfo];
		[request release];
        return self.error;
    }
	
	XMLRPCResponse *userInfoResponse = [[[XMLRPCResponse alloc] initWithData:[request responseData]] autorelease];
	[request release];
	
    err = [self errorWithResponse:userInfoResponse];
	
    if (err) {
		self.error = err;
        return err;
	} else 	
		self.error = nil;
	
    return [userInfoResponse object];
}

- (NSError *)errorWithResponse:(XMLRPCResponse *)res {
    NSError *err = nil;
	
    if ([res isKindOfClass:[NSError class]]) {
        err = (NSError *)res;
    } else {
        if ([res isFault]) {
            NSDictionary *usrInfo = [NSDictionary dictionaryWithObjectsAndKeys:[res fault], NSLocalizedDescriptionKey, nil];
            err = [NSError errorWithDomain:@"org.wordpress.iphone" code:[[res code] intValue] userInfo:usrInfo];
        }
		
        if ([res isParseError]) {
            err = [res object];
        }
    }
	return err;
}

@end
