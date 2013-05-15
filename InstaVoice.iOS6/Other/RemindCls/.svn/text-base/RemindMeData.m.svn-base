//
//  RemindMeData.m
//  RemindMe
//
//  Created by pda.developer@gmail.com on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RemindMeData.h"


@implementation RemindMeData
@synthesize date;
@synthesize month;
@synthesize yeaar;
@synthesize hour;
@synthesize minutes;
@synthesize amOrPm;
@synthesize message;

-(id) init
{
	if (self = [super init])
	{
		self.date = @"dd";
		self.month = @"mm";
		self.yeaar = @"yyyy";
		self.hour = @"hh";
		self.minutes = @"mm";
		self.amOrPm = @"amOrPm";
		self.message = @"";
	}
	return self;
}
-(NSString*) description
{
    if ([self.amOrPm isEqualToString:@"pm"]) {
        int hours = [self.hour integerValue];
        if(hours>0 && hours<12) {
            self.hour = [NSString stringWithFormat:@"%02d",hours+12];
        }
    }
	return [NSString stringWithFormat:@"%@-%@-%@ %@:%@ %@", self.date, self.month, self.yeaar, self.hour, self.minutes, self.amOrPm];
}

-(NSDate*) getDate
{
    if ([self.amOrPm isEqualToString:@"pm"]) {
        int hours = [self.hour integerValue];
        if(hours>0 && hours<12) {
            self.hour = [NSString stringWithFormat:@"%02d",hours+12];
        }
    }
    
    //january|february|march|april|may|june|july|august|september|october|november|december
    if ([self.month isEqualToString:@"january"]) {
        self.month = @"01";
    }
    else if ([self.month isEqualToString:@"february"]) {
        self.month = @"02";
    }
    else if ([self.month isEqualToString:@"march"]) {
        self.month = @"03";
    }
    else if ([self.month isEqualToString:@"april"]) {
        self.month = @"04";
    }
    else if ([self.month isEqualToString:@"may"]) {
        self.month = @"05";
    }
    else if ([self.month isEqualToString:@"june"]) {
        self.month = @"06";
    }
    else if ([self.month isEqualToString:@"june"]) {
        self.month = @"07";
    }
    else if ([self.month isEqualToString:@"august"]) {
        self.month = @"08";
    }
    else if ([self.month isEqualToString:@"september"]) {
        self.month = @"09";
    }
    else if ([self.month isEqualToString:@"october"]) {
        self.month = @"10";
    }
    else if ([self.month isEqualToString:@"november"]) {
        self.month = @"11";
    }
    else if ([self.month isEqualToString:@"december"]) {
        self.month = @"12";
    }
    
    NSLog(@"self.yeaar %@",self.yeaar);
     NSLog(@"self.month %@",self.month);
     NSLog(@"self.date %@",self.date);
     NSLog(@"self.hour %@",self.hour);
     NSLog(@"self.minutes %@",self.minutes);
    
    
	NSString* strDate = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",self.yeaar, self.month, self.date, self.hour, self.minutes];
    NSDateFormatter *formatter;
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSLog(@"formatter dateFromString:strDate is %@ %@",strDate,[formatter dateFromString:strDate]);
    
	return [formatter dateFromString:strDate];
				  
}

-(void) setCurrentDate
{
	NSDateFormatter *formatter;
	formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd-hh-mm"];
	NSString* dat = [formatter stringFromDate:[NSDate date]];
	NSArray* ar = [dat componentsSeparatedByString:@"-"];
	if ([ar count] >= 5)
	{
		self.yeaar = [ar objectAtIndex:0];
		self.month = [ar objectAtIndex:1];
		self.date = [ar objectAtIndex:2];
		self.hour = [ar objectAtIndex:3];
		self.minutes = [ar objectAtIndex:4];
		//self.amOrPm = [ar objectAtIndex:5];
		self.message = @"";
	}
}
@end
