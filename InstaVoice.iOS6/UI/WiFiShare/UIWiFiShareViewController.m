//
//  UIWiFiShareViewController.m
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UIWiFiShareViewController.h"
#import "InstaVoiceAppDelegate.h"
#import "MyHTTPConnection.h"
#import "SettingsManager.h"
#import "Localizer.h"

#import "ZipArchive.h"

#import <ifaddrs.h>
#import <netinet/in.h>
#import <sys/socket.h>

#define SAFE_ARC_RELEASE(x) ([(x) release])
#define SAFE_ARC_RETAIN(x) ([(x) retain])
#define SAFE_ARC_RETAIN(x) ([(x) retain])

@implementation UIWiFiShareViewController
@synthesize btnStart;
@synthesize lblIpPort;
@synthesize txtView;
@synthesize imgReady;
@synthesize customProgress;
@synthesize imgCreating;
@synthesize progressTimmer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
	[imgCreating release];
	[customProgress release];
	[httpServer release];
	[lblIpPort release];
	[txtView release];
	
	[btnStart release];
    [imgReady release];
    [_please_direct release];
    [_wifiShare release];
    [_creating release];
    [_labelShare release];
    [_doneBtn release];
    [_progressController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL), ^(void) {
            [[(InstaVoiceAppDelegate*)[[UIApplication sharedApplication] delegate] listController] updateFlagList];
        });
    [_progressController setProgress:0.0];
    _progressController.progressTintColor=[UIColor purpleColor];
    
    self.imgReady.hidden = YES;
    self.imgCreating.hidden = YES;
    
    self.lblIpPort.text = @"";
    self.txtView.text = @"";
    
    btnStart.enabled = NO;
    
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    
    Localizer * loc =[[Localizer alloc]init];
   // self.doneBtn.titleLabel.text = [loc Done:lang];
    [self.doneBtn setTitle:[loc Done:lang] forState:UIControlStateNormal];
    self.labelShare.text=[loc Share:lang];
    
    NSLog([NSString stringWithFormat: @" Home Main appear "]);
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready.png"] ];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready.png"] ];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready.png"] ];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_fr.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_fr.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_fr.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_fr.png"] ];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_de.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_de.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_de.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_de.png"] ];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_it.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_it.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_it.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_it.png"] ];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_jp.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_jp.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_jp.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_jp.png"] ];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_mn.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_mn.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_mn.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_mn.png"] ];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.creating setImage:[UIImage imageNamed:@"wifi_share_creating_es.png"]];
        [self.please_direct setImage:[UIImage imageNamed:@"wifi_share_please_direct_text_es.png"]];
        [self.wifiShare setImage:[UIImage imageNamed:@"wifi_share_wifi_es.png"]];
        [self.imgReady setImage:[UIImage imageNamed:@"wifi_share_ready_es.png"] ];
    }
    

    [self performSelector:@selector(onClickStart)withObject:nil afterDelay:0.0];
    [self performSelector:@selector(prepareIndexPage)withObject:nil afterDelay:0.6];



}

- (void)setProgressTintColor:(UIColor *)aProgressTintColor
{
    SAFE_ARC_RELEASE(_progressTintColor);
    _progressTintColor = SAFE_ARC_RETAIN(aProgressTintColor);
    const CGFloat* components = CGColorGetComponents(_progressTintColor.CGColor);
    _progressTintColorDark = SAFE_ARC_RETAIN([UIColor colorWithRed:components[0] / 4.0f
                                                             green:components[1] / 4.0f
                                                              blue:components[2] / 4.0f
                                                             alpha:CGColorGetAlpha(_progressTintColor.CGColor)]);
}

- (UIColor*)progressTintColor
{
    if (!_progressTintColor)
    {
        [self setProgressTintColor:[UIColor purpleColor]];
    }
    return _progressTintColor;
}
- (void)viewWillDisappear:(BOOL)animated
{
	[super viewDidAppear:animated];
		//[UIApplication sharedApplication].statusBarHidden = false;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	if (customProgress == nil) {
		self.customProgress = [[[UICustomProgressBarWifiViewController alloc] initWithNibName:@"UICustomProgressBarWifiViewController" bundle:[NSBundle mainBundle]] autorelease];
	
        [self.view addSubview:customProgress.view];
        CGRect rect = customProgress.view.frame;
        rect.origin.y = 220;
        customProgress.view.frame = rect;
        customProgress.view.hidden = true;
    }
}
 


- (void)viewDidUnload
{
    [self setImgReady:nil];
    [self setImgCreating:nil];
    [self setLblIpPort:nil];
    [self setTxtView:nil];
    [self setBtnStart:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Functions

-(void) onClickStart
{
    if (httpServer == nil)
    {
        httpServer = [[MyHTTPServer alloc] init];
        [httpServer setConnectionClass:[MyHTTPConnection class]];
        
        [httpServer setType:@"_http._tcp."];
        
        [httpServer setPort:kSharePort];
        
        //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = WEB_FOLDER;//[NSString stringWithFormat:@"%@/Web", [paths objectAtIndex:0]];
        
        [httpServer setDocumentRoot:[NSURL fileURLWithPath:documentsDirectory]];
    }
    
    NSError *error;
    BOOL success = [httpServer start:&error];
    if (!success)
    {
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc Unabletostartserver:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    [self updateIpList];
}

-(IBAction)onClickStop
{
    [httpServer stop];
    [self removeArchive];
   // [self.view dis]
    [self dismissViewControllerAnimated:YES completion:nil];
//    InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
//    [appDelegate showHome];
}

-(void) updateIpList
{
	NSString* str = [self getFirstIP];
	NSString* ar = [self getIPArray];
	if (str != nil)
		lblIpPort.text = [NSString stringWithFormat:@"http://%@:%d", str, [httpServer port]];
	else 
	{
		NSArray* arr2 = [ar componentsSeparatedByString:@"\r\n"];
		if ([arr2 count] > 0)
			lblIpPort.text = [NSString stringWithFormat:@"http://%@:%d", [arr2 objectAtIndex:0], [httpServer port]];
		else
			lblIpPort.text = ar;
	}
	txtView.font = [UIFont boldSystemFontOfSize:13];
	txtView.text = [NSString stringWithFormat:@"or visit\r\n%@", ar];
}

#pragma mark IP Functions
- (NSString*) getFirstIP
{	
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	NSMutableDictionary* result = [NSMutableDictionary dictionary];
	struct ifaddrs*	addrs;
	BOOL success = (getifaddrs(&addrs) == 0);
	if (success) 
	{
		const struct ifaddrs* cursor = addrs;
		while (cursor != NULL) 
		{
			NSMutableString* ip;
			if (cursor->ifa_addr->sa_family == AF_INET) 
			{
				const struct sockaddr_in* dlAddr = (const struct sockaddr_in*)cursor->ifa_addr;
				const uint8_t* base = (const uint8_t*)&dlAddr->sin_addr;
				ip = [[NSMutableString new] autorelease];
				for (int i = 0; i < 4; i++) 
				{
					if (i != 0) 
						[ip appendFormat:@"."];
					[ip appendFormat:@"%d", base[i]];
				}
				[result setObject:(NSString*)ip forKey:[NSString stringWithFormat:@"%s", cursor->ifa_name]];
			}
			cursor = cursor->ifa_next;
		}
		freeifaddrs(addrs);
	}
	DLog(@"IP addresses: %@", result);
	NSString* ipAddress = @"";
	if ([result count] >0)
	{
		ipAddress = [result objectForKey:@"en0"];
		if (ipAddress == nil)
			ipAddress = [result objectForKey:@"en1"];
		if (ipAddress != nil)
			[ipAddress retain];
	}
	
	[pool release];
	return [ipAddress autorelease];
}

- (NSString*) getIPArray
{	
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	
	NSMutableDictionary* result = [NSMutableDictionary dictionary];
	struct ifaddrs*	addrs;
	BOOL success = (getifaddrs(&addrs) == 0);
	NSString* ipArray = @"";
	if (success) 
	{
		const struct ifaddrs* cursor = addrs;
		while (cursor != NULL) 
		{
			NSMutableString* ip;
			if (cursor->ifa_addr->sa_family == AF_INET) 
			{
				const struct sockaddr_in* dlAddr = (const struct sockaddr_in*)cursor->ifa_addr;
				const uint8_t* base = (const uint8_t*)&dlAddr->sin_addr;
				ip = [[NSMutableString new] autorelease];
				for (int i = 0; i < 4; i++) 
				{
					if (i != 0) 
						[ip appendFormat:@"."];
					[ip appendFormat:@"%d", base[i]];
				}
				ip = [NSString stringWithFormat:@"http://%@:%d", ip, [httpServer port]];
				ipArray = [NSString stringWithFormat:@"%@\r\n%@", ipArray, ip];
				[result setObject:(NSString*)ip forKey:[NSString stringWithFormat:@"%s", cursor->ifa_name]];
			}
			cursor = cursor->ifa_next;
		}
		freeifaddrs(addrs);
	}
	DLog(@"IP addresses: %@", result);

	[ipArray retain];
	[pool release];
	return [ipArray autorelease];
}


#pragma mark Functions 2
-(void) prepareIndexPage
{
       //by EKBPGK Ticket #57
	if (customProgress == nil) {
		customProgress = [[UICustomProgressBarWifiViewController alloc] initWithNibName:@"UICustomProgressBarViewController" bundle:[NSBundle mainBundle]];
	
        [self.view addSubview:customProgress.view];
        CGRect rect = customProgress.view.frame;
        rect.origin.y = 220;
        customProgress.view.frame = rect;
    }
//	[customProgress startCounter];
    
	imgCreating.hidden = NO;
    imgReady.hidden = YES;
//	customProgress.view.hidden = NO;
    _progressController.hidden=NO;
    
    [UtilityManager updateIndexPage];
    btnStart.enabled = YES;
    
    self.progressTimmer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateProgressCounter) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.progressTimmer forMode:NSRunLoopCommonModes];
	[self performSelectorInBackground:@selector(createArchive) withObject:nil];
	//[self performSelectorOnMainThread:@selector(hideProgress) withObject:nil waitUntilDone:YES];
}

-(void) createArchive
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	//sleep(3);
	NSFileManager *fileManager = [NSFileManager defaultManager];	
	BOOL isDir=NO;	

	DBManager* manager = [DBManager sharedManager];
    id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
	
    
    NSString *archivePath = [NSString stringWithFormat:@"%@/%@",WEB_FOLDER ,@"InstaVoice_All.zip"];
    
    NSLog(@"archivePath is :%@",archivePath);
	if ([fileManager fileExistsAtPath:archivePath isDirectory:&isDir]){
		[fileManager removeItemAtPath:archivePath error:nil];
	}
    
	ZipArchive *archiver = [[ZipArchive alloc] init];
	[archiver CreateZipFile2:archivePath];
    
    
    [_progressController setProgress:0.0];
	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
		
        NSString *archivePathSub = [NSString stringWithFormat:@"%@/%@.zip",WEB_FOLDER ,managedObject.name];
        if ([fileManager fileExistsAtPath:archivePathSub isDirectory:&isDir]){
            [fileManager removeItemAtPath:archivePathSub error:nil];
        }
        
        ZipArchive *archiversub = [[ZipArchive alloc] init];
        [archiversub CreateZipFile2:archivePathSub];
        
        NSString *txtFileName = [NSString stringWithFormat:@"%@.txt",managedObject.name];
        NSString *txtFilePath = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,managedObject.name];
        NSString *audioFileName = [NSString stringWithFormat:@"%@.m4a",managedObject.name];
        NSString *audioFilePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
        
        if([fileManager fileExistsAtPath:txtFilePath isDirectory:&isDir] && !isDir){
			[archiversub addFileToZip:txtFilePath newname:txtFileName];		
            [archiver addFileToZip:txtFilePath newname:txtFileName];
		}
        if([fileManager fileExistsAtPath:audioFilePath isDirectory:&isDir] && !isDir){
			[archiversub addFileToZip:audioFilePath newname:audioFileName];		
            [archiver addFileToZip:audioFilePath newname:audioFileName];	
		}
        [archiversub CloseZipFile2];
        [archiversub release];
        
        float value=count-i;
         progressValue=1/value;
        NSLog(@"progressValue first %f",progressValue);
        NSLog(@"progressValue value %f",value);
        
	}
    
    [archiver CloseZipFile2];
	[archiver release];
    
    if(count==0)
    {
        progressValue=1;
    }
    
    //Added for testing
    /*NSDate *future = [NSDate dateWithTimeIntervalSinceNow: 2.2 ];
    [NSThread sleepUntilDate:future];
     */
    
       //by EKBPGK Ticket #57
    NSLog(@"create archive");
    [self performSelectorOnMainThread:@selector(hideProgress) withObject:nil waitUntilDone:YES];
    
    //Added for testing end
    //Change done waitUntilDone:NO to YES only
	[pool release];
}

-(void)updateProgressCounter
{
    NSLog(@"progressValue %f",progressValue);
    [_progressController setProgress:progressValue];
    if(progressValue>=1)
    {
        [self.progressTimmer invalidate];
        self.progressTimmer=nil;
         
        progressValue=0.0;
        
        _progressController.hidden=YES;
         NSLog(@"Timer release");
    }
}


-(void) removeArchive
{
    NSFileManager *fileManager = [NSFileManager defaultManager];	
	BOOL isDir=NO;	
    
	DBManager* manager = [DBManager sharedManager];
    id <NSFetchedResultsSectionInfo> sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
    int count = [sectionInfo numberOfObjects];
	
    
    NSString *archivePath = [NSString stringWithFormat:@"%@/%@",WEB_FOLDER ,@"InstaVoice_All.zip"];
	if ([fileManager fileExistsAtPath:archivePath isDirectory:&isDir]){
		[fileManager removeItemAtPath:archivePath error:nil];
	}
    
	for (int i=0; i<count; i++)
	{
		DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
		
        NSString *archivePathSub = [NSString stringWithFormat:@"%@/%@.zip",WEB_FOLDER ,managedObject.name];
        if ([fileManager fileExistsAtPath:archivePathSub isDirectory:&isDir]){
            [fileManager removeItemAtPath:archivePathSub error:nil];
        }
	}
}


-(void) hideProgress
{
    imgCreating.hidden = YES;
    imgReady.hidden = NO;
	customProgress.view.hidden = YES;
	[customProgress resetCounter];
    
    //Edited by Vineeth for testing
   // [btnStart setTitle: @"myTitle" forState: UIControlStateDisabled];
    btnStart.enabled = YES;
   // [btnStart setTitle: @"Title" forState: UIControlStateNormal];

    
}
@end
