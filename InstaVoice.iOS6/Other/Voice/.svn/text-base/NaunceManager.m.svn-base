//
//  NaunceManager.m
//  DMRecognizer
//
//  Created pda.developer@gmail.com on 4/1/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "NaunceManager.h"
#import "MeterTable.h"

#define FILEPATH [NSTemporaryDirectory() stringByAppendingPathComponent: @"Record.m4a"]

@implementation NaunceManager
@synthesize delegate;
@synthesize isRecroding;
@synthesize isProcessing;
@synthesize voiceSearch;
@synthesize recorder=_recorder;
@synthesize session;
@synthesize startTime;
@synthesize interval;

const unsigned char SpeechKitApplicationKey[] = {0xd3, 0xc, 0xb5, 0x84, 0x2b, 0xa, 0xca, 0x49, 0x0, 0x21, 0x45, 0xc4, 0xb3, 0x24, 0x89, 0xe1, 0xec, 0xa0, 0x90, 0x17, 0x6, 0x86, 0xa3, 0x1d, 0x53, 0x5b, 0x88, 0x56, 0x88, 0x52, 0xa1, 0x5b, 0x5e, 0x56, 0xe0, 0x89, 0x60, 0xaa, 0xd2, 0x60, 0xcb, 0x18, 0x24, 0x7e, 0x3c, 0xad, 0x60, 0x28, 0x4e, 0xf0, 0x3f, 0x54, 0x76, 0xe3, 0x71, 0xca, 0x3e, 0xf9, 0x20, 0xc6, 0x4b, 0xc1, 0x22, 0xa9};  // Ellis Max


static MeterTable *_meterTable;

static NaunceManager* _manager;
+(NaunceManager*) sharedManager
{
	if (_manager == nil)
	{
		_manager = [[NaunceManager alloc] init];
	}
	return _manager;
}

-(id) init
{
	self = [super init];
    if (self) {
        [SpeechKit setupWithID:@"NMDPTRIAL_Boy_Genius_rlinsurf20110103094805" host:@"cq.nmdp.nuancemobility.net" port:443 useSSL:false delegate:self]; //Ellis Max
        
        self.session = [AVAudioSession sharedInstance];
        
        NSError *error;
        if (![self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error])
        {
            NSLog(@"Error: %@", [error localizedDescription]);
            return NO;
        }
        
        if (![self.session setActive:YES error:&error])
        {
            NSLog(@"Error: %@", [error localizedDescription]);
            return NO;
        }
        
        _meterTable = new MeterTable(kMinDBvalue);
    }
	return self;
}

- (void)dealloc {
	[voiceSearch release];
    delete _meterTable;
    [super dealloc];
}

#pragma mark Functions


-(int) getInterval
{
    DLog(@"Get Interval = %f",interval);
    return (int) fabs(interval+0.5);
}

- (BOOL) record
{
	NSError *error;
	
	// Recording settings
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings setValue: [NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
	[settings setValue: [NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
	[settings setValue: [NSNumber numberWithInt: 1] forKey:AVNumberOfChannelsKey]; // mono
	[settings setValue: [NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
	[settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
	[settings setValue: [NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];
	
    if (![self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error])
    {
        NSLog(@"Error: %@", [error localizedDescription]);
        return NO;
    }
    
	// File URL
	NSURL *url = [NSURL fileURLWithPath:FILEPATH];
	
    if (self.recorder.isRecording) {
        [self.recorder stop];
    }
    
    if (self.recorder) {
        self.recorder = nil;
    }
    
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:FILEPATH])
    {
        DLog(@"File already exist");
        [manager removeItemAtPath:FILEPATH error:nil];
    }
    
	// Create recorder
	self.recorder = [[[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error] autorelease];
	if (!self.recorder)
	{
		NSLog(@"Error: %@", [error localizedDescription]);
		return NO;
	}
	
	// Initialize degate, metering, etc.
	self.recorder.delegate = self;
	self.recorder.meteringEnabled = YES;
	
	if (![self.recorder prepareToRecord])
	{
		NSLog(@"Error: Prepare to record failed");
		return NO;
	}
	
	if (![self.recorder record])
	{
		NSLog(@"Error: Record failed");
		return NO;
	}
    
	return YES;
}

-(void) startNuanceRecording
{
    DLog(@"Start Recording");
    
    isRecroding = YES;
    isReady = NO;
    self.startTime = [NSDate date];
    interval = -1;
    [self record];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    if (settings.recordOnly == NO)
    {   
        SKEndOfSpeechDetection detectionType;
        NSString* recoType;
        NSString* langType;
        
        if (settings.dictationIndex == 0) {
            recoType = SKDictationRecognizerType; 
            detectionType = SKLongEndOfSpeechDetection;
        }
        else {
            recoType = SKSearchRecognizerType;
            detectionType = SKShortEndOfSpeechDetection;
        }
        
        if (settings.autoOn == NO) {
            detectionType = SKNoEndOfSpeechDetection;
        }
        
        langType = settings.language;
        DLog(@"Language type = %@", langType);
        DLog(@"Dictation  = %@", recoType);
        
        if (voiceSearch) 
        {
            [voiceSearch release];
            voiceSearch = nil;
        }
        
        voiceSearch = [[SKRecognizer alloc] initWithType:recoType
                                               detection:detectionType
                                                language:langType 
                                                delegate:self];
    }
}

-(void) stopRecording
{
	DLog(@"Stop Recording");
    isReady = NO;
    
    SettingsManager* settings = [SettingsManager sharedManager];
    self.interval = [self.startTime timeIntervalSinceNow]*-1;
    [self.recorder stop];
    
    if (settings.recordOnly == NO) {
        DLog(@"Stopping nunace");
        [voiceSearch stopRecording];
    }
}

-(float) getLevel
{
    if (self.recorder == nil) {
        return 0.0f;
    }
    [self.recorder updateMeters];
	float avg = [self.recorder averagePowerForChannel:0];
    //NSLog(@"avg = %.2f",avg);
    return _meterTable->ValueAt(avg);
}

#pragma mark -
#pragma mark SKRecognizerDelegate methods

- (void)recognizerDidBeginRecording:(SKRecognizer *)recognizer
{
	isRecroding = true;
    DLog(@"Recording started.");
	if ([delegate respondsToSelector:@selector(recognizerDidBeginRecording:)])
		[delegate recognizerDidBeginRecording:recognizer];
}

- (void)recognizerDidFinishRecording:(SKRecognizer *)recognizer
{
    if (self.recorder.isRecording) {
        [self.recorder stop];
    }
    //isRecroding = false;
    DLog(@"Recording finished.");
	if ([delegate respondsToSelector:@selector(recognizerDidFinishRecording:)])
		[delegate recognizerDidFinishRecording:recognizer];
	
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results
{
	DLog(@"Got results.Results = %@", results.results);
    
//    if (isReady && isRecroding) {
    if (isRecroding) {
        if(self.recorder.isRecording)
        {
            self.interval = [self.startTime timeIntervalSinceNow]*-1;
            [self.recorder stop];
        }
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        if ([delegate respondsToSelector:@selector(recognizer:didFinishWithResults:)])
            [delegate recognizer:nil didFinishWithResults:results];
        isRecroding = NO;
    }
    else if (isRecroding)
    {
        //[self performSelector:@selector(processInfiniteLoop) withObject:nil afterDelay:10];
    }
    
    isReady = YES;
	[voiceSearch release];
	voiceSearch = nil;
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    DLog(@"Got error. ＝ %@",[error localizedDescription]);
    if (voiceSearch == nil) {
        return;
    }
    isRecroding = NO;
    if ([delegate respondsToSelector:@selector(recognizer:didFinishWithError:suggestion:)])
        [delegate recognizer:recognizer didFinishWithError:error suggestion:suggestion];

	
	[voiceSearch release];
	voiceSearch = nil;
}

#pragma mark - AVAudioRecorderDelegate

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    DLog(@"FinishRecording successfulyy = %d",flag);
    
    if (flag == NO) {
        if ([delegate respondsToSelector:@selector(recognizer:didFinishWithError:suggestion:)])
            [delegate recognizer:nil didFinishWithError:nil suggestion:nil];
        isRecroding = NO;
        return;
    }
    
    NSString* strFileName = [RECORDINGS_FOLDER stringByAppendingPathComponent: @"Record.m4a"];
    NSString *recordFilePath = FILEPATH;
    NSFileManager* manager = [NSFileManager defaultManager];
    NSError* error = nil;
    if ([manager fileExistsAtPath:strFileName])
    {
        DLog(@"File already exist");
        [manager removeItemAtPath:strFileName error:&error];
    }
    if (error)
    {
        if ([delegate respondsToSelector:@selector(recognizer:didFinishWithError:suggestion:)])
            [delegate recognizer:nil didFinishWithError:error suggestion:nil];
        isRecroding = NO;
        return;
    }
    error = nil;
    
    bool res = [manager copyItemAtPath:(NSString*)recordFilePath toPath:strFileName error:&error];
    self.interval = [self.startTime timeIntervalSinceNow]*-1;
    DLog(@"Result = %d", res);
    
    if (error)
    {
        if ([delegate respondsToSelector:@selector(recognizer:didFinishWithError:suggestion:)])
            [delegate recognizer:nil didFinishWithError:error suggestion:nil];
        isRecroding = NO;
        return;
    }
    
    SettingsManager* settings = [SettingsManager sharedManager];
    
    if ((isReady || settings.recordOnly) && isRecroding) {
    //if (isRecroding) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        
        if ([delegate respondsToSelector:@selector(recognizer:didFinishWithResults:)]) {
            [delegate recognizer:nil didFinishWithResults:nil];
        }
        isRecroding = NO;
    }
    /*
    else if (isRecroding)
    {
        [self performSelector:@selector(processInfiniteLoop) withObject:nil afterDelay:10];
    }
    */
    isReady = YES;
}

- (void)audioRecorderEncodeErrorDidOccur:(AVAudioRecorder *)recorder error:(NSError *)error
{
    if (self.recorder.isRecording) {
        [self.recorder stop];
    }
    isRecroding = NO;
    
    if (voiceSearch != nil) {
        [voiceSearch release];
        voiceSearch = nil;
    }
    
    DLog(@"Got error.");
    DLog(@"Error = %@",[error localizedDescription]);
}

- (void)audioRecorderBeginInterruption:(AVAudioRecorder *)recorder
{
    DLog(@"Got Interruption.");
    if (isRecroding) {
        [self stopRecording];
    }
}


-(void)processInfiniteLoop
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:
                             LOC(@"Save Error")
                                                         forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"Naunce" code:1 userInfo:userInfo];
    if ([delegate respondsToSelector:@selector(recognizer:didFinishWithError:suggestion:)])
        [delegate recognizer:nil didFinishWithError:error suggestion:nil];
    isRecroding = NO;
}
@end
