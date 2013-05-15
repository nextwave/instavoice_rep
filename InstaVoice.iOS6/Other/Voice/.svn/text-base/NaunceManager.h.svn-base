//
//  NaunceManager.h
//  DMRecognizer
//
//  Created pda.developer@gmail.com on 4/1/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpeechKit/SpeechKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <CoreAudio/CoreAudioTypes.h>

#define kMinDBvalue -80.0

@interface NaunceManager : NSObject <SKRecognizerDelegate, SpeechKitDelegate,AVAudioRecorderDelegate> {;
	SKRecognizer* voiceSearch;
	id<SKRecognizerDelegate,AVAudioRecorderDelegate> delegate;
	bool isRecroding;
	bool isProcessing;
    bool isReady;
    NSDate *startTime;
    AVAudioRecorder *_recorder;
	AVAudioSession *session;
    NSTimeInterval interval;
}

+(NaunceManager*) sharedManager;

@property (nonatomic, retain)AVAudioRecorder *recorder;
@property (nonatomic, retain)AVAudioSession *session;
@property (nonatomic) bool isRecroding;
@property (nonatomic) bool isProcessing;
@property(nonatomic, retain) NSDate* startTime;
@property (nonatomic) NSTimeInterval interval;
@property (nonatomic, readonly) SKRecognizer* voiceSearch;
@property (nonatomic, assign) id<SKRecognizerDelegate,AVAudioRecorderDelegate> delegate;
-(void) startNuanceRecording;
-(void) stopRecording;

-(int) getInterval;
-(float) getLevel;
-(void)processInfiniteLoop;
@end
