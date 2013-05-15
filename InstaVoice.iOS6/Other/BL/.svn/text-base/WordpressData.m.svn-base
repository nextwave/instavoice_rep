//
//  WordpressData.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WordpressData.h"
#import "RegexKitLite.h"

@implementation WordpressData
@synthesize strTitle;
@synthesize strMessage;

-(id) init:(NSString*) data
{
	if (self = [super init])
	{
		self.strMessage = @"";
		self.strTitle = @"";
		if (data != nil && [data length] > 0)
		{
			NSString* strRegEx = @"(?i)title(.*) message(.*)";
			data = [data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
			if([data isMatchedByRegex:strRegEx])
			{
				self.strTitle = [data stringByMatching:strRegEx capture:1L];
				self.strMessage = [data stringByMatching:strRegEx capture:2L];
				if (self.strTitle == nil)
					self.strTitle = @"";
				if (self.strMessage == nil)
					self.strMessage = @"";
				
			}
			else 
			{
				self.strMessage = data;
			}
		}
	}
	
	return self;
}

@end
