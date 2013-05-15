//
//  EmailData.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EmailData.h"
#import "RegexKitLite.h"

@implementation EmailData
@synthesize strSubject;
@synthesize strMessage;
@synthesize toNumber;

-(id) init:(NSString*) data
{
	if (self = [super init])
	{
		self.strMessage = @"";
		self.strSubject = @"";
		self.toNumber = @"";
		if (data != nil && [data length] > 0)
		{			
			NSString* strRegEx = @"(?i)(?:subject(.+)){0,1}(?:message(.+))";
			//NSString* strRegEx2 = @"(?i)to(.*)subject(.*)message(.*)";
			data = [data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            /*
			if([data isMatchedByRegex:strRegEx2])
			{
				self.toNumber = [data stringByMatching:strRegEx2 options:RKLDotAll inRange:NSMakeRange(0, [data length]) capture:1L error:nil];
				self.strSubject = [data stringByMatching:strRegEx2 options:RKLDotAll inRange:NSMakeRange(0, [data length]) capture:2L error:nil];
				self.strMessage = [data stringByMatching:strRegEx2 options:RKLDotAll inRange:NSMakeRange(0, [data length]) capture:3L error:nil];
				
				if (self.strSubject == nil)
					self.strSubject = @"";
				if (self.strMessage == nil)
					self.strMessage = @"";
				if (self.toNumber == nil)
					self.toNumber = @"";
			}
			else */
            NSString *match = [data stringByMatching:strRegEx];
            if([match isEqual:@""] == NO) {
                NSString* str1 = [data stringByMatching:strRegEx capture:1];
                NSString* str2 = [data stringByMatching:strRegEx capture:2];
                //NSString* str3 = [data stringByMatching:strRegEx capture:3];
				self.strSubject = str1;
				self.strMessage = str2;
				
				if (self.strMessage == nil)
					self.strMessage = data;
				if (self.strSubject == nil)
					self.strSubject = self.strMessage;
            }
			else 
			{
                data = [UtilityManager removeMatch:data match:@"subject"];
				self.strMessage = data;
                self.strSubject = data;
			}
		}
	}
	
	return self;
}

@end
