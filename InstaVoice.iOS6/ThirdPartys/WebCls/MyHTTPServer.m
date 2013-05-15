#import "MyHTTPServer.h"
#import "MyHTTPConnection.h"
#import "MyWebSocket.h"


@implementation MyHTTPServer

- (id)init
{
	if((self = [super init]))
	{
		// Initialize an array to hold all the WebSocket connections
		webSockets = [[NSMutableArray alloc] init];
		
		// And register for notifications of closed websocket connections
		[[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(webSocketDidDie:)
													 name:WebSocketDidDieNotification
												   object:nil];
	}
	return self;
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	
	[webSockets release];
	[super dealloc];
}

- (void)addWebSocket:(MyWebSocket *)ws
{
	@synchronized(webSockets)
	{
		[webSockets addObject:ws];
	}
}

- (void)webSocketDidDie:(NSNotification *)notification
{
	// Note: This method is called on the thread/runloop that posted the notification
	
	@synchronized(webSockets)
	{
		[webSockets removeObject:[notification object]];
	}
}

@end
