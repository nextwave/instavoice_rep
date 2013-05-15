#import "MyWebSocket.h"
#import "AsyncSocket.h"

#define NO_TIMEOUT -1

#define TAG_PREFIX          100
#define TAG_MSG_PLUS_SUFFIX 101

@implementation MyWebSocket

- (id)initWithSocket:(AsyncSocket *)socket
{
	if((self = [super init]))
	{
		asyncSocket = [socket retain];
		[asyncSocket setDelegate:self];
		
		[asyncSocket readDataToLength:1 withTimeout:NO_TIMEOUT tag:TAG_PREFIX];
		
		term = [[NSData alloc] initWithBytes:"\xFF" length:1];
	}
	return self;
}

- (void)dealloc
{
	[asyncSocket setDelegate:nil];
	[asyncSocket release];
	[super dealloc];
}

- (void)sendMessage:(NSString *)msg
{
	NSData *msgData = [msg dataUsingEncoding:NSUTF8StringEncoding];
	
	NSMutableData *data = [NSMutableData dataWithCapacity:([msgData length] + 2)];
	
	[data appendBytes:"\x00" length:1];
	[data appendData:msgData];
	[data appendBytes:"\xFF" length:1];
	
	[asyncSocket writeData:data withTimeout:NO_TIMEOUT tag:0];
}

- (void)didReceiveMessage:(NSString *)msg
{
	DLog(@"MyWebSocket: didReceiveMessage: %@", msg);
	
	[self sendMessage:[NSString stringWithFormat:@"%@", [NSDate date]]];
}

- (void)didClose
{
	DLog(@"MyWebSocket: didClose");
	
	[[NSNotificationCenter defaultCenter] postNotificationName:WebSocketDidDieNotification object:self];
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark AsyncSocket Delegate
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
	DLog(@"WebSocket: onSocket:didReadData:withTag: %li", tag);
	
	if(tag == TAG_PREFIX)
	{
		UInt8 *pFrame = (UInt8 *)[data bytes];
		UInt8 frame = *pFrame;
		
		if(frame <= 0x7F)
		{
			[asyncSocket readDataToData:term withTimeout:NO_TIMEOUT tag:TAG_MSG_PLUS_SUFFIX];
		}
		else
		{
			DLog(@"WebSocket: Unsupported frame type");
			
			[self didClose];
		}
	}
	else
	{
		NSUInteger msgLength = [data length] - 1; // Excluding ending 0xFF frame
		
		NSString *msg = [[NSString alloc] initWithBytes:[data bytes] length:msgLength encoding:NSUTF8StringEncoding];
		
		[self didReceiveMessage:msg];
		
		[msg release];
	}
}

- (void)onSocketDidDisconnect:(AsyncSocket *)sock
{
	[self didClose];
}

@end
