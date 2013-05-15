//
//  UTF8Util.h
//  InstaVoice
//
//  Created by whiteagle on 09.07.12.
//  Copyright (c) 2012 GenGius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTF8Util : NSObject

+ (NSString*) makeValidUTF8:(NSString*) stringToCheck;
+ (BOOL) isValidUTF8:(NSString*) stringToCheck;
+ (NSString*) removeInvalidCharsFromString:(NSString*) stringToCheck;
+ (NSString*) cleanUpUTF8:(NSString*) input;


@end
