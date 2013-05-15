//
//  InstaVoiceAppDelegate.h
//  InstaVoice
//
//  Created by Wu Ming on 12-2-15.
//  Copyright 2012年 GenGius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIiJotListViewController.h"
#import "UIiJotMainViewController.h"
#import "UISettingsViewController.h"
#import "UIAboutViewController.h"
#import "UIWiFiShareViewController.h"


@interface InstaVoiceAppDelegate : NSObject <UIApplicationDelegate> {
    UIAlertView *alertLoading;
    CLLocationManager *locationManager;  
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (retain, nonatomic) IBOutlet UINavigationController *homeNavController;
@property (retain, nonatomic) IBOutlet UIiJotMainViewController *mainController;

@property (retain, nonatomic) IBOutlet UINavigationController *settingNavController;
@property (retain, nonatomic) IBOutlet UISettingsViewController *settingController;

@property (retain, nonatomic) IBOutlet UINavigationController *aboutNavController;
@property (retain, nonatomic) IBOutlet UIAboutViewController *aboutController;

@property (retain, nonatomic) IBOutlet UINavigationController *wifiNavController;
@property (retain, nonatomic) IBOutlet UIWiFiShareViewController *wifiController;

@property (retain, nonatomic) IBOutlet UINavigationController *listNavController;
@property (retain, nonatomic) IBOutlet UIiJotListViewController *listController;

+(InstaVoiceAppDelegate *) appDelegate;

//Alert
- (void) showLoadingActivityWithText:(NSString*)text;
-(void) dismissActivityByTimer;
-(void) dismissActivityByTimerOnMainThread;

//Tab Click
-(void) showSettings;
-(void) showAbout;
-(void) showHome;
-(void) showList;
-(void) showShare;


@end
