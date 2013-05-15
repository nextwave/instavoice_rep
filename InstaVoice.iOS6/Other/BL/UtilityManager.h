//
//  UtilityManager.h
//  iJott
//
//  Created by pda.developer@gmail.com on 4/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UtilityManager : NSObject {

}

+(bool) createDirectory;

+(int) getFileSize;

+(NSString*) getCurrentTime;

+(NSString*) getJustDate:(NSDate*) date;

+(NSString*) gettDateAndTimeInString:(NSDate*) date;

+(NSString*) getFormattedTime:(NSString*) time;
+(NSString*) getFormatedTime:(int) first second:(int) second;

+(bool) hasStartOREnd:(NSString*) source match:(NSString*) match;
+(bool) containsString:(NSString*) source match:(NSString*) match;
+(NSString*) replaceInsensitive:(NSString*) source what:(NSString*) what with:(NSString*) with;

+(void) regEx;

+(void) printRect:(CGRect) rect;

+(NSString*) removeMatch:(NSString*)origStr match:(NSString*) matc;
+(NSString*) firstCapitalString:(NSString*) str;

+(void) createZipForRecording:(NSString*) fileName;
+(NSString*) createZipForAllRecordings:(NSString*) newFileName;
+(void) deleteRecordingObject:(NSString*) fileName;
+(void) deleteAllRecordings;

#pragma mark HTML Copy
+(void) copyHTMLFiles;

+(void) copyFile:(NSString*)str path:(NSString*) path;

+(void) removeFile:(NSString*) remove;

+(void) updateIndexPage;

+ (NSString*) stringByEscapingForURLArgument:(NSString*) str;
@end
