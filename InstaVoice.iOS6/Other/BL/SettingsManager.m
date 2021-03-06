//
//  SettingsManager.m
//  iJott
//
//  Created pda.developer@gmail.com on 3/30/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "SettingsManager.h"


@implementation SettingsManager
@synthesize language;
@synthesize recordOnly;
@synthesize  sampleRate;
@synthesize audioQuality;
@synthesize patternMatch;
@synthesize autoSave;
@synthesize icloudSync;
@synthesize apiKey;
@synthesize dictationIndex;
@synthesize searchIndex;
@synthesize autoOn;
@synthesize appInit;
@synthesize logsEnable;
@synthesize login;
@synthesize mapIndex;

static SettingsManager*  _manager;
+(SettingsManager*) sharedManager
{
    if (_manager == nil)
    {
        _manager = [[SettingsManager alloc] init];
    }
    return _manager;
}

#pragma mark Functions
-(void) loadSettings
{
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	NSString* val = [defaults objectForKey:@"language"];
	bool firstLoad = false;
	if (val == nil)
	{
		firstLoad = true;
		self.language = @"en_US"; 
	}
	else 
		self.language = val;
	
	self.recordOnly = [defaults boolForKey:@"recordOnly"];
	
	
	val = [defaults objectForKey:@"sampleRate"];
	if (val == nil)
		self.sampleRate = @"44.1K"; 
	else 
		self.sampleRate = val;
	
	val = [defaults objectForKey:@"audioQuality"];
	if (val == nil)
		self.audioQuality = @"44.1K"; 
	else 
		self.audioQuality = val;
	
	self.dictationIndex = [defaults integerForKey:@"dictationType"];
	self.searchIndex = [defaults integerForKey:@"searchIndex"];
    self.mapIndex=[defaults integerForKey:@"mapIndex"];
   
	
	if (firstLoad)
	{
		self.patternMatch = TRUE;
		self.autoSave = TRUE;
        self.icloudSync= true;
		self.autoOn = false;
		self.logsEnable = TRUE;
        self.login = 0;
	}
	else 
	{
		self.patternMatch = [defaults boolForKey:@"patternMatch"];
		self.autoSave = [defaults boolForKey:@"autoSave"];
        
        self.icloudSync = [defaults boolForKey:@"icloudSync"];
		self.autoOn = [defaults boolForKey:@"autoOn"];
		self.logsEnable = [defaults boolForKey:@"logsenable"];
        
        self.login = [defaults integerForKey:@"loginStyle"];
	}
	
	self.apiKey = [defaults integerForKey:@"apiKey"];
}



-(void) saveSettings
{
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:self.language forKey:@"language"];
	[defaults setBool:self.recordOnly forKey:@"recordOnly"];
	[defaults setObject:self.sampleRate forKey:@"sampleRate"];
	[defaults setObject:self.audioQuality forKey:@"audioQuality"];
	[defaults setBool:self.patternMatch forKey:@"patternMatch"];
	[defaults setBool:self.autoSave forKey:@"autoSave"];
    [defaults setBool:self.icloudSync forKey:@"icloudSync"];
	[defaults setInteger:self.apiKey forKey:@"apiKey"];
	[defaults setInteger:self.dictationIndex forKey:@"dictationType"];
	[defaults setInteger:self.searchIndex forKey:@"searchIndex"];
	[defaults setBool:self.autoOn forKey:@"autoOn"];
	[defaults setBool:self.logsEnable forKey:@"logsenable"];
    [defaults setInteger:self.login forKey:@"loginStyle"];
    [defaults setInteger:self.mapIndex forKey:@"mapIndex"];
	[defaults synchronize];
}
@end
