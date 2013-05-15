//
//  UTF8Util.m
//  InstaVoice
//
//  Created by whiteagle on 09.07.12.
//  Copyright (c) 2012 Igor Antonov. All rights reserved.
//

#import "UTF8Util.h"
#import "UtilityManager.h"

@implementation UTF8Util


/* UTF8 fixup methods, by William Denniss, http://williamdeniss.com/ */


// Custom clean UP by Igor Antonov

+ (NSString*) cleanUpUTF8:(NSString*) input 
{
    NSString* tmp = [UTF8Util makeValidUTF8:input];
    tmp = [UtilityManager replaceInsensitive:tmp what:@"\u2013" with:@"-"];
    return tmp;
}

/*
 * Convenience method to do the check and validation in one.
 */
+ (NSString*) makeValidUTF8:(NSString*) stringToCheck
{
	if (![UTF8Util isValidUTF8:stringToCheck])
	{
		return [UTF8Util removeInvalidCharsFromString:stringToCheck];
	}
	else
	{
		return stringToCheck;
	}
}

/*
 * Returns true if the string can be converted to UTF8
 */
+ (BOOL) isValidUTF8:(NSString*) stringToCheck
{
	return ([stringToCheck UTF8String] != nil);
}

/*
 * Removes invalid UTF8 chars from the NSString
 * This method is slow, so only run it on strings that fail the +Util::isValidUTF8 check.
 */
+ (NSString*) removeInvalidCharsFromString:(NSString*) stringToCheck
{
	NSMutableString* fixedUp = [[[NSMutableString alloc] initWithCapacity:[stringToCheck length]] autorelease];
    
	// iterates all characters of the string to check
	for (NSUInteger i = 0; i < [stringToCheck length]; i++)
	{
		// gets the character as a one-char string
		unichar character = [stringToCheck characterAtIndex:i];
		NSString* charString = [[NSString alloc] initWithCharacters:&character length:1];
        
		// converts it individually to UTF8, testing for errors
		if ([charString UTF8String] == nil)
		{
			NSLog(@"Invalid UTF-8 sequence encountered at position %lu. Code: %hu (%X). Replacing with \ufffd", (unsigned long) i, character, character);
			[fixedUp appendString:@"\ufffd"];
		}
		else
		{
			[fixedUp appendString:charString];
		}
		[charString release];
	}
    
	NSLog(@"Util:makeValidUTF8 WARNING: string was NOT valid utf-8.  Orig length %d, fixed length %d", [stringToCheck length], [fixedUp length]);
    
	//NSAssert([fixedUp UTF8String] != nil, @"still nil");
    
	return fixedUp;
}


@end
