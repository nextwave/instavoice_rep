#import "HTTPResponse.h"


@implementation HTTPFileResponse

- (id)initWithFilePath:(NSString *)filePathParam fileName:(NSString*) _fileName
{
	if((self = [super init]))
	{
		filePath = [filePathParam copy];
		fileName = [_fileName copy];
		fileHandle = [[NSFileHandle fileHandleForReadingAtPath:filePath] retain];
		
		if(fileHandle == nil)
		{
			[self release];
			return nil;
		}
		
		NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
		NSNumber *fileSize = [fileAttributes objectForKey:NSFileSize];
		fileLength = (UInt64)[fileSize unsignedLongLongValue];
	}
	return self;
}

- (void)dealloc
{
	[filePath release];
	[fileHandle closeFile];
	[fileHandle release];
	[super dealloc];
}

- (UInt64)contentLength
{
	return fileLength;
}

- (UInt64)offset
{
	return (UInt64)[fileHandle offsetInFile];
}

- (void)setOffset:(UInt64)offset
{
	[fileHandle seekToFileOffset:offset];
}

- (NSData *)readDataOfLength:(NSUInteger)length
{
	return [fileHandle readDataOfLength:length];
}

- (BOOL)isDone
{
	return ([fileHandle offsetInFile] == fileLength);
}

- (NSString *)filePath
{
	return filePath;
}


- (NSDictionary *)httpHeaders
{
	NSMutableDictionary* dict = [NSMutableDictionary dictionary];
	if ([filePath hasSuffix:@".m4a"] || [filePath hasSuffix:@".zip"])
	{
		[dict setObject:@"application/force-download" forKey:@"Content-Type"];
		[dict setObject:[NSString stringWithFormat:@"attachment; filename=\"%@\"",[fileName stringByReplacingOccurrencesOfString:@"/" withString:@""]] forKey:@"Content-Disposition"];
	} else if([filePath hasSuffix:@".txt"]) {
		[dict setObject:@"text/plain;charset=utf-8" forKey:@"Content-Type"];
		[dict setObject:[NSString stringWithFormat:@"attachment; filename=\"%@\"",[fileName stringByReplacingOccurrencesOfString:@"/" withString:@""]] forKey:@"Content-Disposition"];
    }
        
	return dict;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation HTTPDataResponse

- (id)initWithData:(NSData *)dataParam
{
	if((self = [super init]))
	{
		offset = 0;
		data = [dataParam retain];
	}
	return self;
}

- (void)dealloc
{
	[data release];
	[super dealloc];
}

- (UInt64)contentLength
{
	return (UInt64)[data length];
}

- (UInt64)offset
{
	return offset;
}

- (void)setOffset:(UInt64)offsetParam
{
	offset = (unsigned)offsetParam;
}

- (NSData *)readDataOfLength:(NSUInteger)lengthParameter
{
	NSUInteger remaining = [data length] - offset;
	NSUInteger length = lengthParameter < remaining ? lengthParameter : remaining;
	
	void *bytes = (void *)([data bytes] + offset);
	
	offset += length;
	
	return [NSData dataWithBytesNoCopy:bytes length:length freeWhenDone:NO];
}

- (BOOL)isDone
{
	return (offset == [data length]);
}

@end
