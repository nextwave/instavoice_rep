//#import "SimpleWebSocketServerAppDelegate.h"
//#import "MyHTTPServer.h"
//#import "MyHTTPConnection.h"
//
//@implementation SimpleWebSocketServerAppDelegate
//
//@synthesize window;
//
//- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
//{
//	// Create server using our custom MyHTTPServer class
//	httpServer = [[MyHTTPServer alloc] init];
//	
//	// Tell server to use our custom MyHTTPConnection class.
//	// We could have also done this automatically in the MyHTTPServer init method,
//	// but then you would have had to go looking for it.
//	[httpServer setConnectionClass:[MyHTTPConnection class]];
//	
//	// Tell the server to broadcast its presence via Bonjour.
//	// This allows browsers such as Safari to automatically discover our service.
//	[httpServer setType:@"_http._tcp."];
//	
//	// Normally there's no need to run our server on any specific port.
//	// Technologies like Bonjour allow clients to dynamically discover the server's port at runtime.
//	// However, for this example its easier if we specify a port.
//	// This is because the WebSocketTest2.js file is referencing this specific port.
//	[httpServer setPort:kSharePort];
//	
//	// Serve files from our embedded Web folder
//	NSString *webPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Web"];
//	[httpServer setDocumentRoot:[NSURL fileURLWithPath:webPath]];
//	
//	// Start the server (and check for problems)
//	
//	NSError *error;
//	BOOL success = [httpServer start:&error];
//	
//	if(!success)
//	{
//		DLog(@"Error starting HTTP Server: %@", error);
//	}
//}
//
//@end
