//
//  SettingsManager.h
//  iJott
//
//  Created pda.developer@gmail.com on 3/30/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SettingsManager : NSObject {
    NSString* language;
	bool recordOnly;
	bool autoSave;
	NSString* sampleRate;
	NSString* audioQuality;
	bool patternMatch;
	int apiKey;
	int dictationIndex;
	int searchIndex;
	bool autoOn;
	bool appInit;
	bool logsEnable;
    bool icloudSync;
    int login;
}
@property (nonatomic) int login;
@property (nonatomic) int apiKey;
@property (nonatomic) int dictationIndex;
@property (nonatomic) int searchIndex;
@property (nonatomic, copy) NSString* language;
@property (nonatomic) bool recordOnly;
@property (nonatomic) bool autoSave;
@property (nonatomic) bool icloudSync;
@property (nonatomic, copy) NSString* sampleRate;
@property (nonatomic, copy) NSString* audioQuality;
@property (nonatomic) bool patternMatch;
@property (nonatomic) bool autoOn;
@property (nonatomic) bool appInit;
@property (nonatomic) bool logsEnable;
+(SettingsManager*) sharedManager;

-(void) loadSettings;
-(void) saveSettings;
@end
