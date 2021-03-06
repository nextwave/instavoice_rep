//
//  UIiJotMainViewController.m
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UIiJotMainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIiJotListViewController.h"
#import "InstaVoiceAppDelegate.h"
#import "PostProcessing.h"
#import "UTF8Util.h"

#define interval .03125

//bool fromListView;

//code by ankur
//////

#import "Reachability.h"
//////


@implementation UIiJotMainViewController
@synthesize btnTouchToCommand;
@synthesize beginHereView;
@synthesize beginHereImgView;
@synthesize shapeView;
@synthesize backtoOtherView;
@synthesize backAudioImage, holeFillerImage;


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
	[shapeView release];
	[btnTouchToCommand release];
	[helpController release];
	[detailController release];
    [helpDetailController release];
    [txtTranslated release];
    [beginHereView release];
    [beginHereImgView release];
    [backAudioImage release];
    [holeFillerImage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    txtTranslated.layer.masksToBounds = YES;
    txtTranslated.layer.cornerRadius = 10.0;
    txtTranslated.layer.borderWidth = 3.0;
    txtTranslated.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    
    if([self is4InchRetina]) {
        UIImage * backgroundImage = [UIImage imageNamed:@"BackAudio-568h@2x.png"];
        UIImage * holeFiller = [UIImage imageNamed:@"hole_filler-568h@2x.png"];
        backAudioImage.image = backgroundImage;
        holeFillerImage.image = holeFiller;
        CGRect rect = self.view.frame;
        rect.origin.y = -20.0;
        rect.size.height = 568.0;
        backAudioImage.frame = rect;
        holeFillerImage.frame = rect;
        CGRect r = btnTouchToCommand.frame;
        r.origin.y+=44;
        btnTouchToCommand.frame = r;
    }
    
    if (customProgress == nil)
	{
		customProgress = [[UICustomProgressBarViewController alloc] initWithNibName:@"UICustomProgressBarViewController" bundle:[NSBundle mainBundle]];
	}
	[self.view addSubview:customProgress.view];
	CGRect re = customProgress.view.frame;
    if([self is4InchRetina]) {
        re.origin.y = 324;
    } else {
        re.origin.y = 280;
    }
	customProgress.view.hidden = true;
	customProgress.view.frame = re;
	[self.view bringSubviewToFront:customProgress.view];
    
	if (helpController == nil)
	{
		helpController = [[UIHelpMainViewController alloc] initWithNibName:@"UIHelpMainViewController" bundle:[NSBundle mainBundle]];
	}
	helpController.delegate = self;
	CGRect rect2 = helpController.view.frame;
	rect2.origin.y = /*280;*/ self.view.frame.size.height-170;//180
	helpController.view.frame = rect2;
	[self.view addSubview:helpController.view];
    
    
    
	
	[bottomBar.btnHome setSelected:TRUE];
    
	[btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
	
	[self.view bringSubviewToFront:bottomBar.view];
    
    
    
   // [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"isNotFirstLoad"];
    //[[NSUserDefaults standardUserDefaults] synchronize];

    
    
    bool isNotFirstLoad = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isNotFirstLoad"] boolValue];
    //isNotFirstLoad = NO;
    
    
    NSLog(@"First time loaded");
    
    if (isNotFirstLoad == NO) {
        NSLog(@"Not First time loaded");
        beginHereView.hidden = NO;
        UIImage *img1 = [UIImage imageNamed:@"begin_here_arrow_1.png"];
        UIImage *img2 = [UIImage imageNamed:@"begin_here_arrow_2.png"];
        UIImage *img3 = [UIImage imageNamed:@"begin_here_arrow_3.png"];
        beginHereImgView.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];
        
        beginHereImgView.animationDuration = 1;
        [beginHereImgView startAnimating];
        
        [self.view bringSubviewToFront:beginHereView];
        
        bottomBar.view.userInteractionEnabled=FALSE;
        [bottomBar customEnable:NO];
        [self customTouchButtonEnable:NO];

        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isNotFirstLoad"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        beginHereView.hidden = YES;
        beginHereView.userInteractionEnabled = FALSE;
        [beginHereView  removeFromSuperview];
    }
    
    
    //zctest should delete
    /*
    NSString *fname = @"Commands.plist";
    NSString *afilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fname];
    NSDictionary *tdict = [NSDictionary dictionaryWithContentsOfFile:afilePath];
    NSArray *tarray = [tdict allKeys];
    testComandArray = [[NSArray alloc] initWithArray:tarray];
     */
    
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     backtoOtherView=true;
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    NSLog([NSString stringWithFormat: @" Home Main appear "]);
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_es.png"] forState:UIControlStateNormal];
    }
    
    
    
    
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    txtTranslated.text = @"";
    
   // [bottomBar customEnable:false];
    btnTouchToCommand.enabled = YES;
    
    
    if (managerObject) {
        [managerObject release];
        managerObject = nil;
    }
    
    SettingsManager* sManager = [SettingsManager sharedManager];
    
	if (sManager.autoOn && !startOnAutoOn && !sManager.appInit)
	{
		//[btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        btnTouchToCommand.enabled = NO;
        [bottomBar customEnable:NO];
		[self performSelector:@selector(onClickStartStop:) withObject:nil afterDelay:0.5];
        startOnAutoOn = true;
        sManager.appInit = true;
	}
    
    
    // IGOR: Force "Home" button touch
    [bottomBar customEnable:TRUE];
    [bottomBar.btnHome  setSelected:TRUE];
    [self.view bringSubviewToFront:bottomBar.view];
    helpController.btnHelp.enabled = YES;
    
    isEnd = NO;
    backtoOtherView = false;
    
   
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //Edited By Vineeth
    //[self hideHelpTag:YES];
    [self hideHelpTag:NO];
    
    startOnAutoOn = false;
    
    if (beginHereImgView.isAnimating) {
        [beginHereImgView stopAnimating];
        beginHereView.hidden = YES;
    }
}

- (void)viewDidUnload
{
    [self setBtnTouchToCommand:nil];
    [self setShapeView:nil];
    [self setBeginHereView:nil];
    [self setBeginHereImgView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

#pragma mark -
#pragma mark Functions
#pragma mark -

- (void)onClickDone
{
    NaunceManager* manager = [NaunceManager sharedManager];
    if (manager.isRecroding) {
        isEnd = YES;
        [self onClickStartStop:nil];
    }
    
    [detailController dismissViewControllerAnimated:NO completion:^{
        // Nothing to do
    }];
    [self dismissViewControllerAnimated:YES completion:^{
        // Nothing to do
    }];
}

- (void) stopRecordingIn1Minute:(id)sender
{
    NaunceManager* manager = [NaunceManager sharedManager];
    if(manager.isRecroding) {
        [self onClickStartStop:sender];
    }
}

- (IBAction)onClickStartStop:(id)sender 
{
    NSLog(@"onClickStartStop called");
    
    
    
    ////only reachability code added by ankur//////
    Reachability *reach=[Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    
    if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
        
        UIAlertView *alert=[[[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:NSLocalizedString(@"Please check your internet connection", @"")] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
        
        [alert show];
        
    }
    else{
        

    
    
     
    //Edited by Vineeth
   // beginHereView.hidden = YES;
    
    [UIView animateWithDuration:0.3 animations:^() {
        beginHereView.alpha = 0.0;
    }];

    
    
    
    if (beginHereImgView.isAnimating) {
        [beginHereImgView stopAnimating];
        beginHereView.hidden = YES;
    }
    
    if (sender != nil && startOnAutoOn) {
        return;
    }
    txtTranslated.text = @"";
    
	NaunceManager* manager = [NaunceManager sharedManager];
    SettingsManager* settings = [SettingsManager sharedManager];
	manager.delegate = self;
    
	if (!manager.isRecroding)
    {
        startOnAutoOn = false;
        [shapeView doInitSetup];
        
		[manager startNuanceRecording];
        [self performSelector:@selector(stopRecordingIn1Minute:) withObject:sender afterDelay:59.9];
        
        btnTouchToCommand.enabled = false;
        [bottomBar customEnable:false];
        [helpController customHelpEnable:false];
        
        if (settings.recordOnly) {
            btnTouchToCommand.enabled = true;
            SettingsManager* settings = [SettingsManager sharedManager];
            NSString * lang = settings.language;
          
            
            if ([lang compare:@"en_US"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"en_GB"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"en-AU"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"fr_FR"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_fr.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"de_DE"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_de.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"it_IT"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_it.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"ja_JP"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_jp.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"cn_MA"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_mn.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"es_ES"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_es.png"] forState:UIControlStateNormal];
            }
                if (graphTimer)
            {
                [graphTimer invalidate];
                graphTimer = nil;
            }
            
            shapeView.tickCount = 0;
            graphTimer = [NSTimer scheduledTimerWithTimeInterval: interval 
                                                          target: self 
                                                        selector: @selector(updateVUMeter) 
                                                        userInfo: nil 
                                                         repeats:YES];
            shapeView.hidden = false;
            DLog(@"Begin Wave");
        }
        else
        {
            btnTouchToCommand.enabled = NO;
        }
    }
	else
    {
        [self customTouchButtonEnable:NO];
		[manager stopRecording];
        
//by EKBPGK Ticket #64       
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(stopRecordingIn1Minute:) object:sender];
//by EKBPGK Ticket #64 done
        
        if (settings.recordOnly)
		{
			[bottomBar customEnable:false];
            btnTouchToCommand.enabled = NO;
            SettingsManager* settings = [SettingsManager sharedManager];
            NSString * lang = settings.language;
            Localizer* loc = [[Localizer alloc] init];
            
			txtTranslated.text = [loc RecordOnly:lang];//LOC(@"home.record.only");
			
			if (graphTimer)
			{
				[graphTimer invalidate];
				graphTimer = nil;
			}
			shapeView.hidden = true;
            DLog(@"End Wave");
            

 
            
            if ([lang compare:@"en_US"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"en_GB"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"en-AU"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"fr_FR"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_fr.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"de_DE"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_de.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"it_IT"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_it.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"ja_JP"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_jp.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"cn_MA"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_mn.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"es_ES"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_es.png"] forState:UIControlStateNormal];
            }
            [self customTouchButtonEnable:YES];
		}
        else
        {
            btnTouchToCommand.enabled = NO;
            
            SettingsManager* settings = [SettingsManager sharedManager];
            NSString * lang = settings.language;
            
            //Edited By Vineeth
            [self hideHelpTag:YES];
           // [self hideHelpTag:NO];
            
            if (graphTimer)
            {
                [graphTimer invalidate];
                graphTimer = nil;
            }
            DLog(@"End Wave");
            
            shapeView.hidden = true;
            [shapeView removeAnimations];
            
            
            [btnTouchToCommand setImage:[UIImage imageNamed:@"processing.png"] forState:UIControlStateNormal];
            
            if ([lang compare:@"en_US"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"en_GB"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"en-AU"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"fr_FR"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_fr.png"] forState:UIControlStateNormal];
                
            }
            else if ([lang compare:@"de_DE"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_de.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"it_IT"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_it.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"ja_JP"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_jp.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"cn_MA"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_mn.png"] forState:UIControlStateNormal];
            }
            else if ([lang compare:@"es_ES"] == NSOrderedSame)
            {
                [self.btnTouchToCommand setImage:[UIImage imageNamed:@"processing_es.png"] forState:UIControlStateNormal];
            }
            
            
            
            
            
            
            
            DLog(@"Show Processing");
            //[self.view bringSubviewToFront:customProgress.view];
            
            NSLog(@"ENd wave peocessing png and progress view worked");
            customProgress.view.hidden = false;
            [customProgress startCounter];
            //helpController.btnHelp.enabled = NO;
        }
    }
}
    
        NSLog(@"onClickStartStop ended");
}



-(IBAction) test{
    
    
    NSLog(@"Entered in to test");
    UIHelpMainViewController  *uihelpMainViewController=[[UIHelpMainViewController alloc]init];
    
    [uihelpMainViewController onClickHelpShow];

}

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject ];
    
    NSLog(@"MainViewController.touchesBegan");
    //NSLog(@"beginHereView.tag is:%i and beginHereImageView.tag is:%i and %i",beginHereView.tag,beginHereImgView.tag,[touch view].tag);
    if(!beginHereView.hidden && beginHereView.tag==[touch view].tag){
        NSLog(@" beginHereView Touched");
        UIHelpMainViewController  *uihelpMainViewController=[[UIHelpMainViewController alloc]init];
        [uihelpMainViewController onClickHelpShowTwo];
        [uihelpMainViewController release];
        [helpController onClickHelpShow];
        [bottomBar customEnable:TRUE];
        [self customTouchButtonEnable:TRUE];
      //  bottomBar.view.userInteractionEnabled=FALSE;
        //[beginHereView release];
        
    }
}
*/


-(void) customTouchButtonEnable:(bool) val
{
	
    
    self.btnTouchToCommand.enabled = val;
    self.btnTouchToCommand.userInteractionEnabled = val;
    
}

-(void) customEnable:(bool)val
{
    bottomBar.view.userInteractionEnabled=val;
    [bottomBar customEnable:val];
    [self customTouchButtonEnable:val];

}

-(void) hideHelpTag:(BOOL)animation
{
    [helpController onClickHelpClose:animation];
}

-(void) showHelpDetialView
{
    if (helpDetailController == nil)
        [helpDetailController release];
    
    helpDetailController = [[UIHelpDetailViewController alloc] initWithNibName:@"UIHelpDetailViewController" bundle:[NSBundle mainBundle]];
    
	[helpDetailController.customScroll scrollRectToVisible:CGRectMake(0, 0, 100, 100) animated:NO];
    [self.navigationController pushViewController:helpDetailController animated:YES];
    backtoOtherView = true;
}


-(void) saveJot:(NSString*) result
{
    if([result length]<1)
        result=@"Audio only";
    
	NSString *caldate = [UtilityManager  getCurrentTime];
    
	DLog(@"saveNotes");
	[UtilityManager createDirectory];
    NSString* res = result;
    bool storeText = true;
    if(!res) {
        res = LOC(@"main.error");
        storeText = false;
    }
	NSString *text = res;
    
	NSString* sourceFile = [NSString stringWithFormat:@"%@/Record.m4a", DOCUMENTS_FOLDER];
	NSString* destFile = [NSString stringWithFormat:@"%@/%@.m4a", RECORDINGS_FOLDER, caldate];
	NSString* destFileText = [NSString stringWithFormat:@"%@/%@.txt", RECORDINGS_FOLDER, caldate];
	NSFileManager* file = [NSFileManager defaultManager];
	
	DBManager* manager = [DBManager sharedManager];
	SettingsManager* settings = [SettingsManager sharedManager];
    if(storeText) {
        NSString *correctString = [PostProcessing prePattern:text];

  //by EKBPGK Ticket #30
        //correctString = [NSString stringWithCString:[correctString cStringUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF16StringEncoding];
        
        [correctString writeToFile:destFileText atomically:YES encoding:NSUTF16StringEncoding error:nil];
    }
	NSString* fileSize = [NSString stringWithFormat:@"%dK", [UtilityManager getFileSize]];	
    
    [file copyItemAtPath:sourceFile toPath:destFile error:nil];
	[file removeItemAtPath:sourceFile error:nil];
    
    if(storeText) {
        // iCloud Integration
        float version = [[[UIDevice currentDevice] systemVersion] floatValue];
        if(version>=5.0 && settings.icloudSync) {
            NSFileManager *fileManager = [NSFileManager defaultManager];
            if (![fileManager URLForUbiquityContainerIdentifier:nil]) {
                NSLog(@"iCloud container not available.");
            } else {
                NSURL *iCloudURL = [fileManager URLForUbiquityContainerIdentifier:@"JF9KJK8QK2.com.nextwavecomm.instavoice"];
                NSLog(@"%@", [iCloudURL absoluteString]);
                
                //iCloudURL == nil if iCloud is not supported or enable.
                if(iCloudURL){
                    NSUbiquitousKeyValueStore *iCloudStore = [NSUbiquitousKeyValueStore defaultStore];
                    [iCloudStore setString:@"Success" forKey:@"iCloudStatus"];
                    [iCloudStore synchronize]; // For Synchronizing with iCloud Server
                    NSLog(@"iCloud status : %@", [iCloudStore stringForKey:@"iCloudStatus"]);
                }
            }
        }
    }

    
    if (managerObject) {
        [managerObject release];
        managerObject = nil;
    }
    
	managerObject = [manager addNew:[NSString stringWithFormat:@"%@", caldate] text:text extensin:@"m4a" sampleRate:settings.sampleRate audioQuality:settings.audioQuality size:fileSize date:[NSDate date]];	
    [managerObject retain];
}

-(void) showJot:(NSString*) result
{
	if (managerObject == nil) {
        return;
    }
	
	if (detailController == nil)
	{
		detailController = [[UIiJotDetailViewController alloc] initWithNibName:@"UIiJotDetailViewController" bundle:[NSBundle mainBundle]];
	}
    
	detailController.managedObject = managerObject;
	detailController.directAccess = true;
	detailController.matchPattern = true;
	detailController.saveButtonOn = false;
    
    //[self dismissModalViewControllerAnimated:NO];
	[self presentViewController:detailController animated:YES completion:^{
        // Nothing to do
    }];
    //[detailController.txtView resignFirstResponder];
    backtoOtherView = true;  //防止从Detail回来后继续录音
     
}
-(void)sendCrashMail
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    
	if ([MFMailComposeViewController canSendMail])
	{
		
		MFMailComposeViewController *mailViewController = [[[MFMailComposeViewController alloc] init] autorelease];
		mailViewController.mailComposeDelegate = self;
		[mailViewController setSubject:@"Log"];
        
        NSArray *toRecipients=[NSArray arrayWithObject:@"amit.ibcmobile@gmail.com"];
        [mailViewController setToRecipients:toRecipients];
		
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
			//[mailViewController setMessageBody:self.txtView.text isHTML:YES];
		}
        
		[mailViewController setToRecipients:[NSArray arrayWithObjects:SUPPORT_EMAIL,nil]];
        
        //  [self presentModalViewController:mailViewController animated:YES];
        
        
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
-(NSString*) logFileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *fileName =[NSString stringWithFormat:@"%@.log",@"MyLog"];
	NSString *logFilePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	return logFilePath;
}
#pragma mark -
#pragma mark Meter functions
#pragma mark -

- (void)updateVUMeter 
{
	/*
	 Jeffery: Below is the code that adjusts the sine wave. This is the only code in the project that I changed.
	 
	 The values floor, scale  and power contol how the curve is adjusted.
	 
	 The "floor" value sets a minimum level for the sine wave (where 0 is flat and 1.0 is maximum.)
	 The current value of .2 means that in total silence, the curve is still 2/10 of the way to full.
	 
	 Valid values for floor are 0.0 to 1.0. A value of 1.0 would make the sine wave always display at max
	 
	 The power setting applies a non-linear curve to the values. A value of 1.0 means no curve is applied.
	 A value > 1 means the curve only changes a little for low volumes, and then changes a lot for the
	 upper volume level readings.
	 A value <1 means the curve changes more at lower volume levels, and less for the remaining levels.
	 
	 Valid values for power range from approximagely .01 to about 5. Suggest values only a little more 
	 or less than 1.
	 
	 The scale factor is multiplied by the raw volume level. This raises the senstivity of the volume
	 meter.
	 
	 Valid values for scale are .5 to 10 (approximate) Suggest values greater than 1. A value of 0
	 would cause the sine wave to "flatline"
	 
	 The values below seem to work well.
	 */
    
	START_EXCEPTION
	
	static float floor = .4
    ;
	static float power = 1.2;
	static float scale = 3;
	float adjustedAmp;
	float scaledAmp;
    

        float amplitude = [[NaunceManager sharedManager] getLevel];
        adjustedAmp = (amplitude*scale) + floor;
        if (adjustedAmp > 1.0)
            adjustedAmp = 1.0;
        
        scaledAmp = adjustedAmp;
        if (power != 1.0)
            scaledAmp = pow( scaledAmp, power);
        
    
    //  printf("scaledAmp = %.3f\n", scaledAmp);
    
    shapeView.amplitude = scaledAmp;
    //  shapeView.amplitude = 1.0;  //DMC testing
    [shapeView animateWithDuration: interval];
	
	END_EXCEPTION
}

#pragma mark -
#pragma mark SKRecognizerDelegate methods

- (void)recognizerDidBeginRecording:(SKRecognizer *)recognizer
{
    //DLog(@"Recording started.");
	if (graphTimer)
	{
		[graphTimer invalidate];
		graphTimer = nil;
	}
    shapeView.tickCount = 0;
    graphTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(updateVUMeter) userInfo:nil repeats:YES];
	shapeView.hidden = false;
    
	SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_stop_es.png"] forState:UIControlStateNormal];
    }
    btnTouchToCommand.enabled = true;
}

- (void)recognizerDidFinishRecording:(SKRecognizer *)recognizer
{
    //DLog(@"Recording finished.");
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithResults:(SKRecognition *)results
{
    DLog(@"didFinishWithResults");
    SettingsManager* settings = [SettingsManager sharedManager];
    
    NSString* result = @"";
    
    if (settings.recordOnly == NO) {
        if ([results.results count] > 0)
            result = [results.results objectAtIndex:0];
        else
            result = LOC(@"home.no.result.found");
    }
    
    [bottomBar customEnable:false];
    btnTouchToCommand.enabled = YES;
    
    customProgress.view.hidden = true;
    [customProgress resetCounter];
    

    NSString * lang = settings.language;
    
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_es.png"] forState:UIControlStateNormal];
    }
    helpController.btnHelp.enabled = YES;
    [self customTouchButtonEnable:YES];
    [helpController customHelpEnable:true];
    
    if (graphTimer)
    {
        [graphTimer invalidate];
        graphTimer = nil;
    }
    DLog(@"End Wave");
    
    shapeView.hidden = true;
    [shapeView removeAnimations];
    
    if (isEnd) {
        isEnd = NO;
        return;
    }
    
    result = [UTF8Util cleanUpUTF8:result];
    
    // !!DEBUG!!
    //result = @"Find pizza";
    //result = @"Twitter this Testing a cool app #InstaVoice";
    //result = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas pulvinar blandit elit ac sagittis. Suspendisse gravida aliquam elit in ornare. Nullam tempus iaculis consectetur. Nunc augue purus, pellentesque non pulvinar vitae, pulvinar a neque. Sed varius bibendum tellus non viverra. In interdum elementum est eu pellentesque. Donec sed cursus leo. Morbi quis malesuada arcu. Nunc sed leo vel diam sollicitudin sollicitudin vitae sed elit. Praesent semper augue sit amet metus bibendum volutpat.";
    
    [self saveJot:result];
	[self showJot:result];
}

- (void)recognizer:(SKRecognizer *)recognizer didFinishWithError:(NSError *)error suggestion:(NSString *)suggestion
{
    DLog(@"didFinishWithError");
    if (graphTimer)
	{
		[graphTimer invalidate];
		graphTimer = nil;
        DLog(@"End Wave");
	}
    shapeView.hidden = true;
    
	customProgress.view.hidden = true;
	[customProgress resetCounter];
	
	[bottomBar customEnable:true];
	btnTouchToCommand.enabled = true;
    btnTouchToCommand.userInteractionEnabled = true;
    [helpController customHelpEnable:true];
	
    if (graphTimer)
    {
        [graphTimer invalidate];
        graphTimer = nil;
    }
    DLog(@"End Wave");
    
    shapeView.hidden = true;
    [shapeView removeAnimations];
    
    // Save the audio anyway
    [self saveJot:@""];
    SettingsManager* settings = [SettingsManager sharedManager];
	NSString * lang = settings.language;
    
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_es.png"] forState:UIControlStateNormal];
    }
	
    helpController.btnHelp.enabled = YES;
    
    isEnd = NO;
    
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[error localizedDescription] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
	[alert show]; 
	[alert release];
}

/*
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    if (flag) {
        //RecordOnly
        [self saveJot];
        [self showJot];
    }
}
*/

- (IBAction)onClickStartStopDone:(id)sender

{
    
       
    
    
    [txtTranslated resignFirstResponder];
    NSString *str = txtTranslated.text;
    if (str == nil || [str isEqualToString:@""]) {
        return;
    }
    
    [bottomBar customEnable:true];
    [self saveJot:str];
    [self showJot:str];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnTouchToCommand setImage:[UIImage imageNamed:@"touc_to_es.png"] forState:UIControlStateNormal];
    }
    return;
}

    
    
@end
