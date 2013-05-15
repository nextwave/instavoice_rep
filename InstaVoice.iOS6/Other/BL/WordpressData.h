//
//  WordpressData.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WordpressData : NSObject {
	NSString* strTitle;
	NSString* strMessage;
	
}

-(id) init:(NSString*) data;
@property (nonatomic, copy) NSString* strTitle;
@property (nonatomic, copy) NSString* strMessage;

@end
