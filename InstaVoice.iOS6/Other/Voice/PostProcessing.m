//
//  PostProcessing.m
//  InstaVoice
//
//  Created by whiteagle on 10.06.12.
//  Copyright (c) 2012 GenGius. All rights reserved.
//

#import "PostProcessing.h"

@implementation PostProcessing

+(NSString*) prePattern: (NSString*)message {
    
    NSString* textVal = message; //[message lowercaseString];
    
    if ([UtilityManager hasStartOREnd:textVal match:@"flag this"] || [UtilityManager hasStartOREnd:textVal match:@"mark this"])
    {
        if ([UtilityManager hasStartOREnd:textVal match:@"flag this"])
        {
            textVal =[UtilityManager removeMatch:textVal match:@"flag this"];
        }
        else if ([UtilityManager hasStartOREnd:textVal match:@"mark this"])
        {
            textVal =[UtilityManager removeMatch:textVal match:@"mark this"];
        }
    }
    if ([UtilityManager hasStartOREnd:textVal match:@"copy this"])
    {
        textVal =[UtilityManager removeMatch:textVal match:LOC(@"copy this")];
    }

    if ([UtilityManager hasStartOREnd:textVal match:@"add event"] || [UtilityManager hasStartOREnd:textVal match:@"remind me"])
    {
        textVal =[MyDatePattern normalizeTime:textVal];
    }

    if ([UtilityManager containsString:textVal match:@"hashtag"])
    {
        textVal = [UtilityManager replaceInsensitive:textVal what:@"hashtag" with:@"#"];
        
    }

    return [UtilityManager firstCapitalString:textVal];
    
}

@end
