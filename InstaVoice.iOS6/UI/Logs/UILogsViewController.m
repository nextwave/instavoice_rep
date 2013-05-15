//
//  UILogsViewController.m
//  iJot
//
//  Created by pda.developer@gmail.com on 5/17/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UILogsViewController.h"

@implementation UILogsViewController
@synthesize logSwitch;

//int fdErr;

+ (void)badAccess
{
	void (*nullFunction)() = NULL;
	
	nullFunction();

}

@synthesize txtView;
@synthesize scroll;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		//[self onClickRefresh];
	scroll.contentSize = CGSizeMake(2000, 328);
	logSwitch.on = [SettingsManager sharedManager].logsEnable;
    
    if(logSwitch.on)
    {
    NSString *logFilePath = [self logFileName];
	NSFileManager* manager = [NSFileManager defaultManager];
	if ([manager fileExistsAtPath:logFilePath])
	{
        //fclose (stdout);
		NSError* err;
		NSString* str = [NSString stringWithContentsOfFile:logFilePath encoding:NSASCIIStringEncoding error:&err];
        //DLog(@"error = %@", [err description]);
		txtView.text = str;
	}
	else
	{
		txtView.text = @"Log file not exist";
	}
    }
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[logSwitch release];
	[scroll release];
	[txtView release];
    [_NavigationItem release];
    [_DoneBut release];
    [_LoadLogsButt release];
    [_EnableLogsLabel release];
    [_EmailButt release];
    [_CopyButt release];
    [_ClearLogButt release];
    [super dealloc];
}

#pragma mark Functions

+ (void)redirectNSLogToDocumentFolder
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName =[NSString stringWithFormat:@"%@.log",@"MyLog"];
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	NSFileManager* fileManager = [NSFileManager defaultManager];

	DLog(@"logfie path = %@", logFilePath);
    //fdErr = dup(STDERR_FILENO);
    
    /*
    
	FILE* f =  freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
	if (!f)
	{
		if ([fileManager fileExistsAtPath:logFilePath])
			[fileManager removeItemAtPath:logFilePath error:nil];
		DLog(@"attemptin again = %@", logFilePath);
		FILE* f =  freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
		if (!f)
		{
			DLog(@"fail to create");
		}
	}
     */
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    
    self.DoneBut.title = [loc Done:lang];
    self.LoadLogsButt.title=[NSString stringWithFormat:@"load %@ ",[loc logs:lang] ];
    self.NavigationItem.title=[loc logs:lang];
    self.EmailButt.title=[loc Email:lang];
    self.CopyButt.title = [loc copythis:lang];
}

-(IBAction) onClickDone
{
	[self dismissViewControllerAnimated:YES completion:^{
        //Nothing to do
    }];
}

-(IBAction) onClickRefresh
{
	NSString *logFilePath = [self logFileName];
	
	NSFileManager* manager = [NSFileManager defaultManager];
	if ([manager fileExistsAtPath:logFilePath])
	{
			//fclose (stdout);
		NSError* err;
		NSString* str = [NSString stringWithContentsOfFile:logFilePath encoding:NSASCIIStringEncoding error:&err];
			//DLog(@"error = %@", [err description]);
		txtView.text = str;
	}
	else 
	{
		txtView.text = @"Log file not exist"; 
	}

}

-(IBAction) onClickException
{
	[UILogsViewController badAccess];
}

-(IBAction) onClickCopyToClipboard
{
	UIPasteboard* past = [UIPasteboard generalPasteboard];
	[past setValue:self.txtView.text forPasteboardType:@"public.utf8-plain-text"];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Log" message:[loc Messagecopiedtoclipboard:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
	[alert show];
	[alert release];
}

-(IBAction) onClickClear
{
	NSString *logFilePath = [self logFileName];
	NSFileManager* fileManager = [NSFileManager defaultManager];
    fclose(stderr);
    
	if ([fileManager fileExistsAtPath:logFilePath])
		[fileManager removeItemAtPath:logFilePath error:nil];
	
	if (logSwitch.on)
	{
		 [UILogsViewController redirectNSLogToDocumentFolder];
	}
	
	[self onClickRefresh];
}

-(IBAction) onClickSendEmail
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	if ([MFMailComposeViewController canSendMail]) 
	{
		
		MFMailComposeViewController *mailViewController = [[[MFMailComposeViewController alloc] init] autorelease];
		mailViewController.mailComposeDelegate = self;
		[mailViewController setSubject:@"Log"];
		
		NSString* path = [self logFileName];
		NSFileManager* fileManager = [NSFileManager defaultManager];
		if ([fileManager fileExistsAtPath:path])
		{		
			NSData *data = [NSData dataWithContentsOfMappedFile:path]; 
			[mailViewController addAttachmentData:data mimeType:@"text/plain" fileName:@"MyLog.log"];
			[mailViewController setMessageBody:@"Log in attachment" isHTML:YES];
		}
		else 
		{
			[mailViewController setMessageBody:self.txtView.text isHTML:YES];
		}

		[mailViewController setToRecipients:[NSArray arrayWithObjects:SUPPORT_EMAIL,nil]];
		[self presentViewController:mailViewController animated:YES completion:^{
            //Nothing to do
        }];
		//[mailViewController release];
		
	}
	else 
	{			
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Log" message:[loc YourEmailNotConfigured:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	DLog(@"mail sending result = %d", MessageComposeResultSent);
	switch (result) {
		case MFMailComposeResultCancelled:
				//DLog(@"Cancelled");
			break;
		case MFMailComposeResultSent:
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log" message:@"Posted." delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
			break;
		case MFMailComposeResultFailed:
		{
			DLog(@"sending error = %@", [error description]);
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log" message:[loc Emailerror:lang] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
			break;
		
		default:
			break;
	}
	
	[controller dismissViewControllerAnimated:YES completion:^{
        // Nothing to do
    }];
}

+(void)saveCrashLogInFile:(NSException *)exception
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

-(NSString*) logFileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName =[NSString stringWithFormat:@"%@.log",@"MyLog"];
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	return logFilePath;
}

-(IBAction) onClickEnableChange
{
	SettingsManager* manager = [SettingsManager sharedManager];
	manager.logsEnable = logSwitch.on;
	[manager saveSettings];
	if (logSwitch.on)
	{
		[UILogsViewController redirectNSLogToDocumentFolder];
		[self onClickRefresh];
	}
	else 
	{
        //if (dup2(fdErr, STDERR_FILENO) == -1) {
        //    NSLog(@"Redirct to STDERR error");
        //}
		[self onClickClear];
	}
}
@end
