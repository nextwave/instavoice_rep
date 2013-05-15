//
//  MyDatePattern.h
//  RemindMe
//
//  Created by pda.developer@gmail.com on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RemindMeData.h"
#import "RegexKitLite.h"

@interface MyDatePattern : NSObject {
	NSMutableArray* patternArray;
	
    NSMutableArray* repeatArray;
	bool isFromStart;
    
    int repeatStyle;
    
    NSString *dateStr;
    NSString *message;
    
    bool isToday;
    bool isTomorrow;
    
    bool hasTime;
    bool hasDate;
}

@property (nonatomic) bool isFromStart,isToday,isTomorrow,hasDate,hasTime;
@property (nonatomic) int repeatStyle;
@property (nonatomic,retain) NSString *message;

+(MyDatePattern*) sharedObject;

-(RemindMeData*) quickSearch:(NSString*) str;
-(bool) matchPattern:(NSString*) str pattern:(NSString*) pattern;
-(RemindMeData*) getDateWithPattern:(NSString*) pattern;
+(NSString*) normalizeTime:(NSString*) inputTime;
@end
