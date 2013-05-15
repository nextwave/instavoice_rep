//
//  UtilityManager.m
//  iJott
//
//  Created by pda.developer@gmail.com on 4/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UtilityManager.h"
#import "RegexKitLite.h"
#import "ZipArchive.h"

#include <sys/xattr.h>

@implementation UtilityManager

+(bool) createDirectory
{
	NSFileManager* file = [NSFileManager defaultManager];
	NSString* directory = RECORDINGS_FOLDER;
	BOOL isDir=YES;
		
	if(![file fileExistsAtPath:directory isDirectory:&isDir])
	{
		if (![file createDirectoryAtPath:directory withIntermediateDirectories:true attributes:nil error:nil])
		{
			DLog(@"Error: Create folder failed");
			return FALSE;
		}
    }
	
//	directory = [NSString stringWithFormat:@"%@/Recordings/css",DOCUMENTS_FOLDER];
//	isDir=YES;
//	
//	if(![file fileExistsAtPath:directory isDirectory:&isDir])
//	{
//		if (![file createDirectoryAtPath:directory withIntermediateDirectories:true attributes:nil error:nil])
//		{
//			DLog(@"Error: Create folder failed");
//			return FALSE;
//		}
//	}
//	
//	directory = [NSString stringWithFormat:@"%@/Recordings/images",DOCUMENTS_FOLDER];
//	isDir=YES;
//	
//	if(![file fileExistsAtPath:directory isDirectory:&isDir])
//	{
//		if (![file createDirectoryAtPath:directory withIntermediateDirectories:true attributes:nil error:nil])
//		{
//			DLog(@"Error: Create folder failed");
//			return FALSE;
//		}
//	}
//	
//	directory = [NSString stringWithFormat:@"%@/Recordings/js",DOCUMENTS_FOLDER];
//	isDir=YES;
//	
//	if(![file fileExistsAtPath:directory isDirectory:&isDir])
//	{
//		if (![file createDirectoryAtPath:directory withIntermediateDirectories:true attributes:nil error:nil])
//		{
//			DLog(@"Error: Create folder failed");
//			return FALSE;
//		}
//	}
	
	
	return TRUE;
}

+(int) getFileSize
{
	NSString* sourceFile = [NSString stringWithFormat:@"%@/Record.m4a", DOCUMENTS_FOLDER];
	NSFileManager* file = [NSFileManager defaultManager];
	NSDictionary* dict = [file attributesOfItemAtPath:sourceFile error:nil];
	NSString* val = [dict objectForKey:@"NSFileSize"];
	int size = 0;
	if (val != nil)
	{
		size = [val intValue];
		size = size/1024;
	}
	DLog(@"attributes = %@", dict);		 
	return size;
}

+(NSString*) getCurrentTime
{
	
		//US: 2011-06-3-20-43-08, Rest of world: 26-05-2011-17-27-13
	
	NSDateFormatter *formatter;
	NSString        *dateString;
	
		//	SettingsManager* settings = [SettingsManager sharedManager];
	
	formatter = [[NSDateFormatter alloc] init];
		//[formatter setDateFormat:@"dd-MM-yyyy-HH-mm-ss"];
//	if ([settings.language compare:@"en_US"] == NSOrderedSame)
//	{
		[formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
//	}
//	else 
//	{
//		[formatter setDateFormat:@"dd-MM-yyyy-HH-mm-ss"];
//	}
	
	
	
	dateString = [formatter stringFromDate:[NSDate date]];
	
	[formatter release];
	
	DLog(@"Current time = %@", dateString);
	return dateString;
}

+(NSString*) getJustDate:(NSDate*) date
{
		//US: 2011-06-3-20-43-08, Rest of world: 26-05-2011-17-27-13 
		//en_US
	NSDateFormatter *formatter;
	
	formatter = [[NSDateFormatter alloc] init];
		//	SettingsManager* settings = [SettingsManager sharedManager];
//	if ([settings.language compare:@"en_US"] == NSOrderedSame)
//	{
		[formatter setDateFormat:@"yyyy-MM-dd"];
//	}
//	else 
//	{
//		[formatter setDateFormat:@"dd-MM-yyyy"];
//	}
	
	
	NSString* dateString = [formatter stringFromDate:date];
	
	[formatter release];
	return dateString;
}

+(NSString*) gettDateAndTimeInString:(NSDate*) date
{
		//US: 2011-06-3-20-43-08, Rest of world: 26-05-2011-17-27-13 
		//en_US
	NSDateFormatter *formatter;
	NSString        *dateString;
	
		//	SettingsManager* settings = [SettingsManager sharedManager];
	
	formatter = [[NSDateFormatter alloc] init];
		//[formatter setDateFormat:@"dd-MM-yyyy-HH-mm-ss"];
//	if ([settings.language compare:@"en_US"] == NSOrderedSame)
//	{
		[formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//	}
//	else 
//	{
//		[formatter setDateFormat:@"[dd-MM-yyyy HH:mm:ss]"];
//	}
	
	
	
	dateString = [formatter stringFromDate:date];
	
	[formatter release];

	return dateString;
}


+(bool) hasStartOREnd:(NSString*) source match:(NSString*) match
{
	if (source == nil || [source length] == 0)
		return false;
	if (match == nil || [match length] == 0)
		return false;
	
	if ([[source lowercaseString] hasPrefix:[match lowercaseString]] || [[source lowercaseString] hasSuffix:[match lowercaseString]])
	{
		return true;
	}
	
	return false;
}

+(bool) containsString:(NSString*) source match:(NSString*) match {
	if (source == nil || [source length] == 0)
		return false;
	if (match == nil || [match length] == 0)
		return false;
    return [[source lowercaseString] rangeOfString:[match lowercaseString]].location != NSNotFound;
}

+(NSString*) replaceInsensitive:(NSString*) source what:(NSString*) what with:(NSString*) with {
    return [source stringByReplacingOccurrencesOfString:what withString:with options:NSCaseInsensitiveSearch range:NSMakeRange(0, [source length])];
}

+(void) regEx
{
//	{
//		NSString* source = @"One\t Two \nThree ";
//		NSString* result = [source stringByReplacingOccurancesOfRegex:@"\\s+"
//														   withString:@" "];
//		NSLog(source);
//		NSLog(result);
//	}
//
//	{
//		NSString* source = @"Test;12;Y";
//		NSArray* columns = [source componentsSeparatedByRegex:@";\\s*"];
//		NSLog([columns description]);
//	}
//	{
//		NSString* source = @"<foo no=\"12\">Name</foo>";
//		NSString* regex = @"<foo no=\"(.+?)\">(.*?)</foo>";
//		int no = [[source stringByMatching:regex capture:1] intValue];
//		NSString* data = [source stringByMatching:regex capture:2];
//		DLog(@"no: %d data: %@", no, data);
//	}
}

+(void) printRect:(CGRect) rect
{
	DLog(@"x= %lf, y= %lf, widht =%lf, height=%lf", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

+(NSString*) removeMatch:(NSString*)origStr match:(NSString*) matc
{
	if (origStr == nil || [origStr length] == 0)
		return origStr;
	NSString* result = origStr;
    
    /*
	if ([[origStr lowercaseString] hasPrefix:[matc lowercaseString]])
	{
		result = [origStr substringFromIndex:[matc length]];
	}
	else if ([[origStr lowercaseString] hasSuffix:[matc lowercaseString]])
	{
		result = [origStr substringToIndex:[origStr length] - [matc length]];
	}
     */
    /*
    NSRange rang = [[origStr lowercaseString] rangeOfString:[matc lowercaseString]];
    
    if (rang.location != NSNotFound) {
        NSString *str1 = [origStr substringToIndex:rang.location];
        NSString *str2 = [origStr substringFromIndex:rang.location+rang.length];
        result = [NSString stringWithFormat:@"%@%@",str1,str2];
    }
     */
    result = [self replaceInsensitive:result what:matc with:@""];
	if ([result length] > 0)
		result = [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	return [UtilityManager firstCapitalString:result];
}

+(NSString*) getFormattedTime:(NSString*) time
{
	NSString* calculatedTime = [time stringByReplacingOccurrencesOfString:@" s" withString:@""];
	if ([calculatedTime length] > 0)
	{
		int totalTime = [calculatedTime intValue];		
		return [NSString stringWithFormat:@"%@",[UtilityManager getFormatedTime:totalTime/60 second:totalTime%60]];
	}
	return @"0:00:00";
}

+(NSString*) getFormatedTime:(int) first second:(int) second
{
	NSString* result = @"";
	if (first<10)
	{
		result = [NSString stringWithFormat:@"0%d", first];
	}
	else
	{
		result = [NSString stringWithFormat:@"%d", first];
	}
	NSString* result2 = @"";
	if (second<10)
	{
		result2 = [NSString stringWithFormat:@"0%d", second];
	}
	else
	{
		result2 = [NSString stringWithFormat:@"%d", second];
	}
	return [NSString stringWithFormat:@"0:%@:%@", result, result2];
}

+(NSString*) firstCapitalString:(NSString*) str
{
	if (str != nil && [str length] > 0)
	{
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
		//DLog(@"in = %@", str);
		NSString* temp = [str stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[str substringToIndex:1] uppercaseString]];
		//DLog(@"after = %@", temp);
		return temp;
	}
	DLog(@"in else with string = %@", str);
	return str;
}

#pragma mark HTML Copy
+(void) copyHTMLFiles
{
    NSFileManager* file = [NSFileManager defaultManager];
    NSError * error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:WEB_FOLDER
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
	NSString* directory = WEB_FOLDER;
	BOOL isDir=YES;
    
	if(![file fileExistsAtPath:directory isDirectory:&isDir])
	{
		if (![file createDirectoryAtPath:directory withIntermediateDirectories:true attributes:nil error:nil])
		{
			DLog(@"Error: Create folder failed");
		}
        else
        {
            NSURL *url = [NSURL fileURLWithPath:directory];
            
            const char* filePath = [[url path] fileSystemRepresentation];
            
            const char* attrName = "com.apple.MobileBackup";
            u_int8_t attrValue = 1;
            
            setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
        }
    }
    
	[UtilityManager removeFile:@"style.css"];
	[UtilityManager removeFile:@"redirect.html"];
	[UtilityManager removeFile:@"arrowIconSmall.png"];
	[UtilityManager removeFile:@"background1.png"];
	[UtilityManager removeFile:@"background2.png"];
	[UtilityManager removeFile:@"background3.png"];
	[UtilityManager removeFile:@"buttonBlack.png"];
	[UtilityManager removeFile:@"buttonRed.png"];
	[UtilityManager removeFile:@"header.png"];
	[UtilityManager removeFile:@"headerBackground1.png"];
	[UtilityManager removeFile:@"headerBackground2.png"];
	[UtilityManager removeFile:@"icons.png"];
	[UtilityManager removeFile:@"rowHover.png"];
	[UtilityManager removeFile:@"shadowBottom.png"];
	[UtilityManager removeFile:@"shadowTop.png"];	
	[UtilityManager removeFile:@"deleteBtn1.png"];
	[UtilityManager removeFile:@"deleteBtn2.png"];
	
	[UtilityManager removeFile:@"jquery1.js"];
	[UtilityManager removeFile:@"jquery2.js"];
	
	
	[UtilityManager copyFile:@"style.css" path:@""];
	[UtilityManager copyFile:@"redirect.html" path:@""];
	[UtilityManager copyFile:@"arrowIconSmall" path:@".png"];
	[UtilityManager copyFile:@"background1" path:@".png"];
	[UtilityManager copyFile:@"background2" path:@".png"];
	[UtilityManager copyFile:@"background3" path:@".png"];
	[UtilityManager copyFile:@"buttonBlack" path:@".png"];
	[UtilityManager copyFile:@"buttonRed" path:@".png"];
	[UtilityManager copyFile:@"header" path:@".png"];
	[UtilityManager copyFile:@"headerBackground1" path:@".png"];
	[UtilityManager copyFile:@"headerBackground2" path:@".png"];
	[UtilityManager copyFile:@"icons" path:@".png"];
	[UtilityManager copyFile:@"rowHover" path:@".png"];
	[UtilityManager copyFile:@"shadowBottom" path:@".png"];
	[UtilityManager copyFile:@"shadowTop" path:@".png"];
	[UtilityManager copyFile:@"deleteBtn1" path:@".png"];
	[UtilityManager copyFile:@"deleteBtn2" path:@".png"];
	
	[UtilityManager copyFile:@"jquery1.js" path:@""];
	[UtilityManager copyFile:@"jquery2.js" path:@""];
}

+(void) updateIndexPage
{
	DBManager* manager = [DBManager sharedManager];
	
	[UtilityManager copyHTMLFiles];
	NSMutableString* tableStr = [[NSMutableString alloc] init];
	
	id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
	
	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
		if (i == 0)
			[tableStr appendFormat:@"<tr class=\"first\">"];
		else
			[tableStr appendFormat:@"<tr>"];
		
        
        //<a href=\"#\" class=\"icon iconDelete\">&nbsp;</a>
		[tableStr appendFormat:@"<td class=\"column1\"><a class=\"left\" href=\"#\"><span onclick=\"document.location.href='/%@?del'\" class=\"icon iconDelete\">&nbsp;</span><span>%@</span></a></td>",managedObject.name, [UtilityManager getJustDate:managedObject.date]];
		[tableStr appendFormat:@"<td class=\"column2\"><a class=\"left\" href=\"/%@?zip\"><span class=\"icon iconDownload\">&nbsp;</span><span>%@.zip</span></a></td>", managedObject.name,managedObject.name];
        
		[tableStr appendFormat:@"<td class=\"column3\"><a class=\"left\" href=\"/%@?txt\"><span class=\"icon iconDownload\">&nbsp;</span><span>%@</span></a></td>", managedObject.name,  managedObject.message];
		[tableStr appendFormat:@"<td class=\"column4\"><a class=\"left\" href=\"/%@?m4a\"><span class=\"icon iconAudio\">&nbsp;</span><span style=\"margin-right: 10px;\">%@</span><span class=\"icon iconDownload\">&nbsp;</span></a></td>", managedObject.name, [UtilityManager getFormattedTime:managedObject.duration]];
		[tableStr appendFormat:@"</tr>"];
		
	}
	
	NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"index.html"];
	NSString * strContents = [NSString stringWithContentsOfFile:sourceFilePath encoding:NSUTF8StringEncoding error:nil];
	
	strContents = [strContents stringByReplacingOccurrencesOfString:@"<!--Add Text Here-->" withString:(NSString*)tableStr];
	
	//NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    //    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"/Web/index.html"];
    NSString *writableDBPath = [WEB_FOLDER stringByAppendingPathComponent:@"index.html"];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];
	if ([fileManager fileExistsAtPath:writableDBPath])
	{
		[fileManager removeItemAtPath:writableDBPath error:nil];
	}
	
	NSData* data = [strContents dataUsingEncoding:NSUTF8StringEncoding];
	[data writeToFile:writableDBPath atomically:true];
	
	[tableStr release];
}


+(void) createZipForRecording:(NSString*) fileName
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSFileManager *fileManager = [NSFileManager defaultManager];	
	BOOL isDir=NO;	
    
    NSString *archivePathSub = [NSString stringWithFormat:@"%@/%@.zip",WEB_FOLDER,fileName];
    NSLog(@"Generating ZIP for :%@",archivePathSub);
    if ([fileManager fileExistsAtPath:archivePathSub isDirectory:&isDir]){
        [fileManager removeItemAtPath:archivePathSub error:nil];
    }
    
    ZipArchive *archiversub = [[ZipArchive alloc] init];
    [archiversub CreateZipFile2:archivePathSub];
    
    NSString *txtFileName = [NSString stringWithFormat:@"%@.txt",fileName];
    NSString *txtFilePath = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,fileName];
    NSString *audioFileName = [NSString stringWithFormat:@"%@.m4a",fileName];
    NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,fileName];
    
    if([fileManager fileExistsAtPath:txtFilePath isDirectory:&isDir] && !isDir){
        [archiversub addFileToZip:txtFilePath newname:txtFileName];		
    }
    if([fileManager fileExistsAtPath:audioFilePath isDirectory:&isDir] && !isDir){
        [archiversub addFileToZip:audioFilePath newname:audioFileName];		
    }
    [archiversub CloseZipFile2];
    [archiversub release];
    
	[pool release];
}

+(NSString*) createZipForAllRecordings:(NSString*) newFileName
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSFileManager *fileManager = [NSFileManager defaultManager];	
	BOOL isDir=NO;	
    
	DBManager* manager = [DBManager sharedManager];
	
	id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
    
    NSString* result = [NSString stringWithFormat:@"%@.%@",newFileName ,@"zip"];
	
    NSString *archivePathSub = [NSString stringWithFormat:@"%@/%@",WEB_FOLDER,result];
    NSLog(@"Generating ZIP for :%@",archivePathSub);
    if ([fileManager fileExistsAtPath:archivePathSub isDirectory:&isDir]){
        [fileManager removeItemAtPath:archivePathSub error:nil];
    }
    ZipArchive *archiversub = [[ZipArchive alloc] init];
    [archiversub CreateZipFile2:archivePathSub];

	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSString* fileName = managedObject.name;
        NSString *txtFileName = [NSString stringWithFormat:@"%@.txt",fileName];
        NSString *txtFilePath = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,fileName];
        NSString *audioFileName = [NSString stringWithFormat:@"%@.m4a",fileName];
        NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,fileName];
        
        if([fileManager fileExistsAtPath:txtFilePath isDirectory:&isDir] && !isDir){
            [archiversub addFileToZip:txtFilePath newname:txtFileName];		
        }
        if([fileManager fileExistsAtPath:audioFilePath isDirectory:&isDir] && !isDir){
            [archiversub addFileToZip:audioFilePath newname:audioFileName];		
        }
    }
    [archiversub CloseZipFile2];
    [archiversub release];
    return result;
    
	[pool release];
}


+(void) deleteRecordingObject:(NSString*) fileName
{
	DBManager* manager = [DBManager sharedManager];
	NSManagedObjectContext *context =  [manager managedObjectContext];
	
	id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
	
	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
		if ([managedObject.name isEqualToString:fileName])
		{
			NSString* filePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
			NSFileManager* file = [NSFileManager defaultManager];
			if ([file fileExistsAtPath:filePath isDirectory:NO])
			{
				[file removeItemAtPath:filePath error:nil];
			}
			NSString* filePathText = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,managedObject.name];
			if ([file fileExistsAtPath:filePathText isDirectory:NO])
			{
				[file removeItemAtPath:filePathText error:nil];
			}
			[context deleteObject:managedObject];
            break;
		}
	}
	[[DBManager sharedManager] saveContext];
}

+(void) deleteAllRecordings
{
	DBManager* manager = [DBManager sharedManager];
	NSManagedObjectContext *context =  [manager managedObjectContext];
	
	id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
	
	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        NSString* filePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
        NSFileManager* file = [NSFileManager defaultManager];
        if ([file fileExistsAtPath:filePath isDirectory:NO])
        {
            [file removeItemAtPath:filePath error:nil];
        }
        NSString* filePathText = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,managedObject.name];
        if ([file fileExistsAtPath:filePathText isDirectory:NO])
        {
            [file removeItemAtPath:filePathText error:nil];
        }
        [context deleteObject:managedObject];
	}
	[[DBManager sharedManager] saveContext];
}


+(void) copyFile:(NSString*)str path:(NSString*) path
{
	NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:str];
	
	NSString* destFile = @"";

	{
        NSError * error = nil;
        [[NSFileManager defaultManager] createDirectoryAtPath:WEB_FOLDER
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:&error];
		destFile = [NSString stringWithFormat:@"%@/%@%@", WEB_FOLDER,str, path];
	}

	NSFileManager* manager = [NSFileManager defaultManager];
		//	if (![manager fileExistsAtPath:destFile])
	{
		[manager copyItemAtPath:sourceFilePath toPath:destFile error:nil];
	}
	
}

+(void) removeFile:(NSString*) remove
{
    NSError * error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:WEB_FOLDER
                              withIntermediateDirectories:YES
                                               attributes:nil
                                                    error:&error];
	NSString* destFile = [NSString stringWithFormat:@"%@/%@", WEB_FOLDER, remove];
	NSFileManager* manager = [NSFileManager defaultManager];
	if ([manager fileExistsAtPath:destFile])
	{
		[manager removeItemAtPath:destFile error:nil];
	}
}

+ (NSString*) stringByEscapingForURLArgument:(NSString*) str
{
		// Encode all the reserved characters, per RFC 3986
	CFStringRef escaped1 = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
															  (CFStringRef)str,
															  NULL,
															  (CFStringRef)@";/?:@&+$,",  
															  kCFStringEncodingUTF8);
    
	return [(NSString*)escaped1 autorelease];
}

@end
