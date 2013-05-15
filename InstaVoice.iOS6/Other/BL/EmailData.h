//
//  EmailData.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EmailData : NSObject {
	NSString* strSubject;
	NSString* strMessage;
	NSString* toNumber;

}

-(id) init:(NSString*) data;
@property (nonatomic, copy) NSString* strSubject;
@property (nonatomic, copy) NSString* strMessage;
@property (nonatomic, copy) NSString* toNumber;

@end
