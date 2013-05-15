#import <Foundation/Foundation.h>

@class AsyncSocket;


#define WebSocketDidDieNotification  @"WebSocketConnectionDidDie"

@interface MyWebSocket : NSObject
{
	AsyncSocket *asyncSocket;
	NSData *term;
}

- (id)initWithSocket:(AsyncSocket *)socket;

- (void)sendMessage:(NSString *)msg;
- (void)didReceiveMessage:(NSString *)msg;

- (void)didClose;

@end
