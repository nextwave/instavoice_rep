//
//  RemindMeData.h
//  RemindMe
//
//  Created by pda.developer@gmail.com on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RemindMeData : NSObject {
	NSString* date;
	NSString* month;
	NSString* yeaar;
	NSString* hour;
	NSString* minutes;
	
	NSString* amOrPm;	
	NSString* message;
}

@property (nonatomic, copy) NSString* date;
@property (nonatomic, copy) NSString* month;
@property (nonatomic, copy) NSString* yeaar;
@property (nonatomic, copy) NSString* hour;
@property (nonatomic, copy) NSString* minutes;
@property (nonatomic, copy) NSString* amOrPm;

@property (nonatomic, copy) NSString* message;

-(void) setCurrentDate;

-(NSDate*) getDate;
-(NSString*) description;
@end
