//
//  MyDatePattern.m
//  RemindMe
//
//  Created by pda.developer@gmail.com on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyDatePattern.h"

@implementation MyDatePattern
@synthesize isFromStart;
@synthesize repeatStyle;
@synthesize message;
@synthesize isTomorrow,isToday,hasDate,hasTime;

static MyDatePattern* _manager;

+(MyDatePattern*) sharedObject
{
	if (_manager == nil)
		_manager = [[MyDatePattern alloc] init];
	return _manager;
}

-(id) init
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    
	if (self = [super init])
	{
		patternArray = [[NSMutableArray alloc] init];
		
        repeatArray = [[NSMutableArray alloc] init];
        
        // day month year with at time
        [patternArray addObject:@"MM DD yyyy at hh:mm ap"];
        [patternArray addObject:@"MM DD yyyy at hh:mm"];
        [patternArray addObject:@"MM DD yyyy at hh ap"];
        
        // day month year without at time
        [patternArray addObject:@"MM DD yyyy hh:mm ap"];
        [patternArray addObject:@"MM DD yyyy hh:mm"];
        [patternArray addObject:@"MM DD yyyy hh ap"];
        
        
        // short with at
        [patternArray addObject:[loc atmidnight:lang] ];
        [patternArray addObject:[loc atnoon:lang]];
        
        // short without at
        [patternArray addObject:[loc midnight:lang]];
        [patternArray addObject:[loc noon:lang]];
        
        [patternArray addObject:@"MM DD yyyy"];
        
        // DD MM with at
        [patternArray addObject:@"MM DD at hh:mm ap"];
        [patternArray addObject:@"MM DD at hh:mm"];
        [patternArray addObject:@"MM DD at hh ap"];
        [patternArray addObject:[loc atmidnight:lang] ];
        [patternArray addObject:[loc atnoon:lang]];
        
        // DD MM without at
        [patternArray addObject:@"MM DD hh:mm ap"];
        [patternArray addObject:@"MM DD hh:mm"];
        [patternArray addObject:@"MM DD hh ap"];
        [patternArray addObject:[loc midnight:lang]];
        [patternArray addObject:[loc noon:lang]];
        [patternArray addObject:@"MM DD"];
        
        // day month year with at time
        [patternArray addObject:@"DD MM yyyy at hh:mm ap"];
        [patternArray addObject:@"DD MM yyyy at hh:mm"];
        [patternArray addObject:@"DD MM yyyy at hh ap"];
        
        // day month year without at time
        [patternArray addObject:@"DD MM yyyy hh:mm ap"];
        [patternArray addObject:@"DD MM yyyy hh:mm"];
        [patternArray addObject:@"DD MM yyyy hh ap"];
        
        // short with at
        [patternArray addObject:[loc atmidnight:lang] ];
        [patternArray addObject:[loc atnoon:lang]];
        
        // short without at
        [patternArray addObject:[loc midnight:lang]];
        [patternArray addObject:[loc noon:lang]];
        
        [patternArray addObject:@"DD MM yyyy"];
        
        // DD MM with at
        [patternArray addObject:@"DD MM at hh:mm ap"];
        [patternArray addObject:@"DD MM at hh:mm"];
        [patternArray addObject:@"DD MM at hh ap"];
        [patternArray addObject:[loc atmidnight:lang] ];
        [patternArray addObject:[loc atnoon:lang]];
        
        // DD MM without at
        [patternArray addObject:@"DD MM hh:mm ap"];
        [patternArray addObject:@"DD MM hh:mm"];
        [patternArray addObject:@"DD MM hh ap"];
        [patternArray addObject:[loc midnight:lang]];
        [patternArray addObject:[loc noon:lang]];
        
        [patternArray addObject:@"DD MM"];
        
        [patternArray addObject:@"at hh:mm ap"];
        [patternArray addObject:@"at hh:mm"];
        
        [patternArray addObject:@"at hh ap"];
        
        [patternArray addObject:@"hh:mm ap"];
        [patternArray addObject:@"hh:mm"];
        
        [patternArray addObject:@"hh ap"];
		
		[patternArray addObject:[loc atmidnight:lang] ];
        [patternArray addObject:[loc atnoon:lang]];
		
        [patternArray addObject:[loc midnight:lang]];
        [patternArray addObject:[loc noon:lang]];
	}
    
    [repeatArray addObject:@"repeat every day"];
    [repeatArray addObject:@"repeat every week"];
    [repeatArray addObject:@"repeat every two weeks"];
    [repeatArray addObject:@"repeat every month"];
    [repeatArray addObject:@"repeat every year"];
    
	return self;
}

-(void) dealloc
{
	[patternArray release];
	[repeatArray release];
	[super dealloc];
}

#pragma mark Functions

-(RemindMeData*) quickSearch:(NSString*) str
{
    
    
    NSLog(@"string passed to quicksearch is:%@",str);
	self.message = [[str lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSLog(@"string after trimming is:%@ ans repeat array Count is:%i",self.message,[repeatArray count]);
    
    repeatStyle = -1;
    for (int i=0; i<[repeatArray count]; i++) {
        if ([self.message rangeOfString:[repeatArray objectAtIndex:i]].location != NSNotFound) {
            self.message = [UtilityManager removeMatch:self.message match:[repeatArray objectAtIndex:i]];
            repeatStyle = i;
            break;
        }
    }
    NSLog(@"string after remove match is:%@",self.message);
    
    
    if (repeatStyle == -1) {
        DLog(@"No Repeat");
    }
    else
        DLog(@"repeat Style = %@",[repeatArray objectAtIndex:repeatStyle]);
    
    isToday = NO;
    isTomorrow = NO;
    
    RemindMeData *retData = nil;
    
    hasDate = NO;
    hasTime = NO;
    
    NSLog(@"pattern array is:%@",patternArray);
    
	for (int i=0; i<[patternArray count]; i++)
	{
		NSString* pattern = [patternArray objectAtIndex:i];
        
        NSLog(@"self.message is:%@ and pattern is:%@",self.message,pattern);
        
		if ([self matchPattern:self.message pattern:pattern])
        {
			//return [self getDateWithPattern:pattern];
            
            NSLog(@"PatternArray index:%d",i);
            NSLog(@"PatternArray value:%@",[patternArray objectAtIndex:i]);
            
            NSLog(@"self.message is:%@ and pattern is:%@",self.message,pattern);
            
            retData = [self getDateWithPattern:pattern];
            self.message = [self.message stringByReplacingOccurrencesOfRegex:[self getRegexpFromGenericPattern:pattern] withString:@""];  
            
            
            NSLog(@"retData with PatternArray value:%@",retData);
            break;
        }
	}
    
    if ([UtilityManager containsString:self.message match:LOC(@"today")]) {
        self.message = [UtilityManager removeMatch:self.message match:LOC(@"today")];
        isToday = YES;
    }
    else if ([UtilityManager containsString:self.message match:LOC(@"at today")]) {
        self.message = [UtilityManager removeMatch:self.message match:LOC(@"at today")];
        isToday = YES;
    }
    else if ([UtilityManager containsString:self.message match:LOC(@"tomorrow")]) {
        self.message = [UtilityManager removeMatch:self.message match:LOC(@"tomorrow")];
        isTomorrow = YES;
    }
    else if ([UtilityManager containsString:self.message match:LOC(@"at tomorrow")]) {
        self.message = [UtilityManager removeMatch:self.message match:LOC(@"at tomorrow")];
        isTomorrow = YES;
    }
    
    
    NSLog(@"Return data is:%@",retData);
	return retData;
}

-(RemindMeData*) getDateWithPattern:(NSString*) pattern
{
    hasDate = NO;
    hasTime = NO;
	DLog(@"Getting date");
	DLog(@"Pattern = %@", pattern);
    NSLog(@"dateStr is:%@",dateStr);
	NSArray* array = [dateStr componentsSeparatedByString:@" "];
    NSLog(@"dateStr Array is:%@",array);
    
	NSArray* lPatternArray = [pattern componentsSeparatedByString:@" "];
	
	RemindMeData* data = [[RemindMeData alloc] init];
	
	[data setCurrentDate];
	
	int i = 0;
	int j = 0;
	
    
    i = [array count] -1;
    j =[lPatternArray count] -1;
	
	
	while (TRUE)
	{
		
		if (isFromStart)
		{
			if (j >= [lPatternArray count])
				break;
		}
		else
		{
			if (j <0)
				break;
		}
		
		NSString* lStrToMatch = [array objectAtIndex:i];
		NSString* lPattern = [lPatternArray objectAtIndex:j];
		
		if ([lPattern compare:@"DD"] == NSOrderedSame)
		{
             NSLog(@"data.date is%@",lStrToMatch);
            
			data.date = [[lStrToMatch stringByReplacingOccurrencesOfString:@"th" withString:@""] stringByReplacingOccurrencesOfString:@"st" withString:@""];
            hasDate = YES;
            NSLog(@"data.date is%@",data.date);
		}
		else if ([lPattern compare:@"MM"] == NSOrderedSame)
		{
			data.month = lStrToMatch;
            hasDate = YES;
		}
		else if ([lPattern compare:@"yyyy"] == NSOrderedSame)
		{
			data.yeaar = lStrToMatch;
            hasDate = YES;
		}
		else if ([lPattern compare:@"at"] == NSOrderedSame)
		{
			
		}
		else if ([lPattern compare:@"hh:mm"] == NSOrderedSame)
		{
			NSArray* arr = [lStrToMatch componentsSeparatedByString:@":"];
			if ([arr count] >= 2)
			{
				data.hour = [arr objectAtIndex:0];
				data.minutes = [arr objectAtIndex:1];
			}
            hasTime = YES;
		}
		else if ([lPattern compare:@"hh"] == NSOrderedSame)
		{
			data.hour = lStrToMatch;
            hasTime = YES;
		}
		else if ([lPattern compare:@"mm"] == NSOrderedSame)
		{
			data.minutes = lStrToMatch;
            hasTime = YES;
		}
		else if ([lPattern compare:@"ap"] == NSOrderedSame)
		{
			data.amOrPm = lStrToMatch;
		}
		else if ([lPattern compare:LOC(@"midnight")] == NSOrderedSame)
		{
			data.hour = @"12";
			data.minutes = @"00";
			data.amOrPm = @"am";
            hasTime = YES;
		}
		else if ([lPattern compare:LOC(@"noon")] == NSOrderedSame)
		{
			data.hour = @"12";
			data.minutes = @"00";
			data.amOrPm = @"pm";
            hasTime = YES;
		}
		
        
        i--;
        j--;
		
	}

    data.message = dateStr;
	
	return [data autorelease];
}

-(NSString*) getRegexpFromGenericPattern:(NSString*) pattern
{
    NSString *regStr = [pattern copy];
    regStr = [regStr stringByReplacingOccurrencesOfString:@"ap" withString:@"(am|pm)"]; //must replace this before replace MM, april include ap
    regStr = [regStr stringByReplacingOccurrencesOfString:@"DD" withString:@"(0{0,1}[1-9]|[1-2][0-9]|3[0-1])"];
    
    NSLog(@"After date Conversion:%@ in matchPattern",regStr);
    
    //Edited here by adding a whitespaces after the monthnames eg"january"  to "january "
    
    NSString *str1 = @"january";
    NSString *str2 = @"february";
    NSString *str3 = @"march";
    NSString *str4 = @"april";
    NSString *str5 = @"may";
    NSString *str6 = @"june";
    NSString *str7 = @"july";
    NSString *str8 = @"august";
    NSString *str9 = @"september";
    NSString *str10 = @"october";
    NSString *str11 = @"november";
    NSString *str12 = @"december";
    NSString *mmStr = [NSString stringWithFormat:@"(%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@)",str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12];
    
    regStr = [regStr stringByReplacingOccurrencesOfString:@"MM" withString:mmStr];
    
    NSLog(@"After month Conversion:%@ in matchPattern",regStr);
    
    regStr = [regStr stringByReplacingOccurrencesOfString:@" yyyy" withString:@"((,)* \\d{4})"];
    
    NSLog(@"After year Conversion:%@ in matchPattern",regStr);
    
    
    regStr = [regStr stringByReplacingOccurrencesOfString:@"hh" withString:@"(0{0,1}[0-9]|[12][0-9])"];
    regStr = [regStr stringByReplacingOccurrencesOfString:@"mm" withString:@"(0{0,1}[0-9]|[0-5][0-9])"];
    
    NSLog(@"After time Conversion:%@ in matchPattern",regStr);
    
    return regStr;
}

-(bool) matchPattern:(NSString*)str pattern:(NSString*)pattern
{
	NSString* lStr = [str lowercaseString];
    NSLog(@"lStr is:%@",lStr);
    
    NSString *regStr = [self getRegexpFromGenericPattern:pattern];
    
    NSLog(@"lStr is:%@ and regStr is:%@  ",lStr,regStr);
    
    NSRange r = [lStr rangeOfString:regStr options:NSRegularExpressionSearch|NSBackwardsSearch];
    
    
	if (r.location == NSNotFound) {
        return false;
    }
    
    //************
    NSString *param = nil;
    NSRange start = [lStr rangeOfString:@"id=%"];
    if (start.location != NSNotFound)
    {
        param = [lStr substringFromIndex:start.location];
        NSRange end = [param rangeOfString:@"%"];
        if (end.location != NSNotFound)
        {
            param = [lStr substringToIndex:end.location];
        }
    }

   NSLog(@"param is:%@ ",param);   
    
    NSString *value = [[lStr substringToIndex:[lStr length] - 1] substringFromIndex:1];
    NSLog(@"value is:%@ ",value); 
    
    
    //***********
    
    
    NSLog(@"range r is :%i ",r.length); 
    
    
    dateStr = [lStr substringWithRange:r];
    
    
    NSLog(@"dateStr is:%@ lStr is:%@ ",dateStr,lStr);
    NSLog(@"%d", r.length); 
    
    
    //Commented by Vineeth
    //self.message = [UtilityManager removeMatch:lStr match:dateStr];
    
     NSLog(@" self.message -end- in matchPattern :%@",self.message); 
    
	return true;
}

+(NSString*) normalizeTime:(NSString*) inputTime
{
    NSString* message = [inputTime lowercaseString];

    // Fix the hh mm ap pattern > hh:mm ap 
    message = [message stringByReplacingOccurrencesOfRegex:@"[,\\.]" withString:@""];
    
    // Fix the 1st 21st etc
    message = [message stringByReplacingOccurrencesOfRegex:@"(\\s)([\\d]{1,2})(st|nd|rd|th)" withString:@"$1$2"];
    
    // Fix the hh mm ap pattern > hh:mm ap 
    message = [message stringByReplacingOccurrencesOfRegex:@"([\\d]{1,2}) ([\\d]{1,2}) (\\d) (am|pm)" withString:@"$1:$2 $3 $4"];
    
    // Fix the 10:50 7 PM pattern
    NSString *regStr = @"([\\d]{1,2}):([\\d]{1,2}) (\\d) (am|pm)";
    NSString *match = [message stringByMatching:regStr];
    if([match isEqual:@""] == NO) {
        int t1 = [[message stringByMatching:regStr capture:2] intValue];
        int t2 = [[message stringByMatching:regStr capture:3] intValue];
        NSString* repl = [NSString stringWithFormat:@"$1:%d $4",t1+t2];
        message = [message stringByReplacingOccurrencesOfRegex:regStr withString:repl];
    }

    // Fix the hh mm ap pattern > hh:mm ap 
    message = [message stringByReplacingOccurrencesOfRegex:@"([\\d]{1,2}) ([\\d]{1,2}) (am|pm)" withString:@"$1:$2 $3"];

    // Fix the hh ap pattern > hh:00 ap 
    message = [message stringByReplacingOccurrencesOfRegex:@"(\\s)([\\d]{1,2}) (am|pm)" withString:@"$1$2:00 $3"];
    
    
    return message;
}

@end