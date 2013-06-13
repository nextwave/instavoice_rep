//
//  InstaVoiceAppDelegate.m
//  InstaVoice
//
//  Created by Wu Ming on 12-2-15.
//  Copyright 2012年 GenGius. All rights reserved.
//com.nextwavecomm.instavoice

#import "InstaVoiceAppDelegate.h"
#import "DBManager.h"
#import "SettingsManager.h"
#import "UILogsViewController.h"

@implementation InstaVoiceAppDelegate

@synthesize window=_window;
@synthesize homeNavController = _homeNavController;
@synthesize mainController = _mainController;
@synthesize settingNavController = _settingNavController;
@synthesize settingController = _settingController;
@synthesize aboutNavController = _aboutNavController;
@synthesize aboutController = _aboutController;
@synthesize wifiNavController = _wifiNavController;
@synthesize wifiController = _wifiController;
@synthesize listNavController = _listNavController;
@synthesize listController = _listController;

+(InstaVoiceAppDelegate*) appDelegate
{
	return (InstaVoiceAppDelegate *)[[UIApplication sharedApplication] delegate];
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TestFlight integration
    
    #define TESTING 1
#ifdef TESTING
    //[TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
   
    // ios6
   //[TestFlight setDeviceIdentifier:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    
#endif
    //[TestFlight takeOff:@"1917a1ebd07da555d458e086e0c2614e_MTQ5MzU2MjAxMi0xMC0zMCAwOTozMzozMS43MjA2MDY"];
    
    
    [[SettingsManager sharedManager] loadSettings];
	//руддщ
	//[[SeperateContactContext sharedObject] performSelector:@selector(saveAllContacts) withObject:nil afterDelay:4];
    //[[DBManager sharedManager] saveContext];
    
	if ([SettingsManager sharedManager].logsEnable)
	{
		[UILogsViewController redirectNSLogToDocumentFolder];
	}
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    [self performSelector:@selector(installUncaughtExceptionHandler) withObject:nil afterDelay:0];
    
    NSString *filePath=[self logFileName];
    FILE *fp = fopen([filePath UTF8String],"r");
    if(fp)
    {
    [self startSendEmail];
    }
    
   
    self.window.rootViewController = self.homeNavController;
    [self.window makeKeyAndVisible]; 
    return YES;
}

- (void)installUncaughtExceptionHandler
{
	InstallUncaughtExceptionHandler();
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    if (self.window.rootViewController == self.wifiNavController) {
         [self.wifiController onClickStop];
    }
    else if (self.window.rootViewController == self.settingNavController) {
        [self.settingController onClickDone];
    }
    else if (self.window.rootViewController == self.aboutNavController) {
        [self.aboutController onClickDone];
    }
    else if (self.window.rootViewController == self.homeNavController) {
        [self.mainController onClickDone];
    }
    else
    {
        [self.listController onClickDone];
    }
    
    

    [self showHome];
    
    [[SettingsManager sharedManager] saveSettings];
    [[DBManager sharedManager] saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    return [FBSession.activeSession handleOpenURL:url];
//}


- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    [[SettingsManager sharedManager] saveSettings];
	[[DBManager sharedManager] saveContext];
}

void uncaughtExceptionHandler(NSException *exception)
{
    if ([SettingsManager sharedManager].logsEnable)
    {
   // [UILogsViewController saveCrashLogInFile:exception];
         InstaVoiceAppDelegate *appdel = (InstaVoiceAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appdel saveCrashLogFile:exception];
    }
    // Internal error reporting
}
-(void)saveCrashLogFile:(NSException *)exception
{
    //    NSLog(@"CRASH: %@", exception);
    //    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName =[NSString stringWithFormat:@"%@.log",@"MyLog"];
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    //	NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSMutableString *crashDiscription=[[NSMutableString alloc] init];
    FILE *fp = fopen([logFilePath UTF8String],"r");
    NSString *priviousLog=@"";
    if(fp)  // if login file is present call web service for authentication
    {
        priviousLog=[NSString stringWithContentsOfFile:logFilePath encoding:NSUTF8StringEncoding error:nil];
    }
    
    if([priviousLog length]>0)
    {
        [crashDiscription appendString:priviousLog];
        [crashDiscription appendString:@"\n"];
    }
	
    
    NSString *name = exception.name;
    NSString *reason = exception.reason;//userInfo
    
    NSArray *tempArray=[exception callStackSymbols];
    NSString *strInfo=[tempArray description];
    
    NSString *userInfo=[strInfo description];
    
    
    [crashDiscription appendString:name];
    [crashDiscription appendString:@"\n"];
    [crashDiscription appendString:reason];
    [crashDiscription appendString:@"\n"];
    [crashDiscription appendString:userInfo];
    
    [crashDiscription writeToFile:logFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];

    [crashDiscription release];
    DLog(@"logfie reason = %@", crashDiscription);
    
}
-(void)startSendEmail
{
    
    
    SKPSMTPMessage *testMsg = [[SKPSMTPMessage alloc] init];
    testMsg.fromEmail = @"findmehere.noreply@gmail.com";//   tmail.test123456
    
    //testMsg.toEmail = @"skv180@gmail.com,shiv.kumar@ibcmobile.com,sk_941@rediffmail.com,abhinav.agarwal@ibcmobile.com";//   //test@test.com
    //set all mail id to send
    testMsg.toEmail=@"shiv.kumar.ibcmobile@gmail.com,grndlvl@gmail.com";
    
    testMsg.relayHost = @"smtp.gmail.com";
    testMsg.requiresAuth = YES;
    testMsg.login = @"findmehere.noreply@gmail.com";
    testMsg.pass = @"find.app1!.me";//1234.test
    testMsg.subject = @"Crash Reports";
    //testMsg.bccEmail = @"testbcc@test.com";
    testMsg.wantsSecure = YES; // smtp.gmail.com doesn't work without TLS!
    
    // Only do this for self-signed certs!
    // testMsg.validateSSLChain = NO;
    testMsg.delegate = self;
    
   // SettingsManager* settings = [SettingsManager sharedManager];
    NSString* path = [self logFileName];
    
    NSData *data = [NSData dataWithContentsOfMappedFile:path];
//    [mailViewController addAttachmentData:data mimeType:@"text/plain" fileName:@"MyLog.log"];
//    [mailViewController setMessageBody:@"Log in attachment" isHTML:YES];
    
   // NSData *imagedata=UIImagePNGRepresentation(screenShotImage);
    
//    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"inline;\r\n\tfilename=\"Location.png\"\"",kSKPSMTPPartContentDispositionKey,
//                               @"base64",kSKPSMTPPartContentTransferEncodingKey,
//                               @"image/png;\r\n\tname=Location.png;\r\n\tx-unix-mode=0666\"",kSKPSMTPPartContentTypeKey,[imagedata encodeWrappedBase64ForData],kSKPSMTPPartMessageKey,
//                               nil];
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"inline;\r\n\tfilename=\"Mylog.log\"\"",kSKPSMTPPartContentDispositionKey,
                               @"base64",kSKPSMTPPartContentTransferEncodingKey,
                               @"text/plain;\r\n\tname=Mylog.log;\r\n\tx-unix-mode=0666\"",kSKPSMTPPartContentTypeKey,[data encodeWrappedBase64ForData],kSKPSMTPPartMessageKey,
                               nil];
    
    
    //@"image/png\r\n\t-unix-mode=0644;\r\n\tname=\"01new.png\"\""
    
    
    testMsg.parts = [NSArray arrayWithObjects:plainPart,nil];
    
    [testMsg send];
    
}
-(NSString*) logFileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName =[NSString stringWithFormat:@"%@.log",@"MyLog"];
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	return logFilePath;
}
- (void)messageSent:(SKPSMTPMessage *)message
{
    [message release];
   
    NSString *logFilePath = [self logFileName];
	NSFileManager* fileManager = [NSFileManager defaultManager];
    fclose(stderr);
    
	if ([fileManager fileExistsAtPath:logFilePath])
		[fileManager removeItemAtPath:logFilePath error:nil];
    
    
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Success" message:@"Crash Logs Send Successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
    //////////////NSLog(@"delegate - message sent");
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    [message release];
    
    NSString *errorMessage=[error localizedDescription];
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Error" message:errorMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
    //////////////NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
    //////////////NSLog(@"delegate -: %@", [error localizedDescription]);
}


- (void)dealloc
{
    [_window release];
    [_homeNavController release];
    [_mainController release];
    [_settingNavController release];
    [_settingController release];
    [_aboutNavController release];
    [_aboutController release];
    [_wifiNavController release];
    [_wifiController release];
    [_listNavController release];
    [_listController release];
    [super dealloc];
}

#pragma mark Activity Methods
- (void) showLoadingActivityWithText:(NSString*)text
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	if(alertLoading == nil)
	{
		alertLoading = [[UIAlertView alloc] initWithTitle: LOC(@"app.name")
												  message: nil
												 delegate: self
										cancelButtonTitle: nil
										otherButtonTitles: nil];
		UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		activityView.frame = CGRectMake(139.0f-18.0f, 50.0f, 37.0f, 37.0f);
		[alertLoading addSubview:activityView];
		[activityView startAnimating];
	}
	alertLoading.title = text;
	[alertLoading show];	
	[pool release];
	
}

-(void) dismissActivityByTimer
{
	[self performSelectorOnMainThread:@selector(dismissActivityByTimerOnMainThread) withObject:nil waitUntilDone:NO];
}

-(void) dismissActivityByTimerOnMainThread
{
	if (alertLoading != nil && alertLoading.visible)
	{
		[alertLoading dismissWithClickedButtonIndex:99 animated:YES];
	}
}

#pragma mark Show/Hide Functions
-(void) showSettings
{
    if (self.window.rootViewController != self.settingNavController) {
        self.window.rootViewController = self.settingNavController;
    }
}

-(void) showAbout
{
    if (self.window.rootViewController != self.aboutController) {
        [self.aboutController.customScroll scrollRectToVisible:CGRectMake(0, 0, 100, 100) animated:NO];
        self.window.rootViewController = self.aboutNavController;
    }
}

-(void) showHome
{
    self.mainController.backtoOtherView = NO;
    if (self.window.rootViewController == self.homeNavController) {
        [self.mainController hideHelpTag:YES];
    }
    else
    {
        //[self.mainController hideHelpTag:NO];
        self.window.rootViewController = self.homeNavController;
    }
}

-(void) showList
{
    if (self.window.rootViewController != self.listNavController) {
        self.window.rootViewController = self.listNavController;
        
    }
}

-(void) showShare
{
    if (self.window.rootViewController != self.wifiNavController) {
   //     self.window.rootViewController = self.wifiNavController;
       // [self.window.rootViewController presentModalViewController:self.wifiNavController animated:YES];
        
        [self.window.rootViewController presentViewController:self.wifiNavController animated:YES completion:nil];
    }
}

@end
