//
//  WordpressManager.h
//  iJott
//
//  Created by pda.developer@gmail.com on 5/23/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLRPCRequest.h"
#import "XMLRPCResponse.h"

@interface WordpressManager : NSObject {
	NSString* username;
	NSString* password;
	NSString* idValue;
	NSString* xmlRPC;
	NSError* error;
}
@property (nonatomic, retain) NSError* error;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* password;
@property (nonatomic, copy) NSString* idValue;
@property (nonatomic, copy) NSString* xmlRPC;

+(WordpressManager*) sharedManager;
-(void) loadSettings;
-(void) saveSettings;

-(bool) login:(NSString*) username password:(NSString*) password;
-(void) post:(NSString*) title message:(NSString*) message;

- (id)executeXMLRPCRequest:(XMLRPCRequest *)req;
- (NSError *)errorWithResponse:(XMLRPCResponse *)res;
@end
