//
//  UIiJotDetailViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 4/3/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UIiJotDetailViewController.h"
#import "InstaVoiceAppDelegate.h"
#import "UISettingsAddAccountViewController.h"

//#import "UIMyPersonViewController.h"
#import "EmailData.h"

#import <EventKit/EventKit.h>
#import <EventKit/EKEventStore.h>
#import <EventKitUI/EventKitUI.h>



#import "WordpressManager.h"
#import "WordpressData.h"

#import "PostProcessing.h"

#import <Social/Social.h>


//Edited By Vineeth
/*
#define kOAuthConsumerKey			@"iMOXhShW1wlMb4UF9mXfA"
#define kOAuthConsumerSecret		@"Vq7NvTTybV6INlkPbacrPIpvAbDWGR5vUJ58Klt0DU"



#define kAppId						@"197176626985041"
#define kApiKey						@"ebf90614f0337661b94d67f8521af12c"
#define kApiSecret					@"02570c56424d4dc6b1fe8f30e723b6be" // @"<YOUR SECRET KEY>";
#define kGetSessionProxy			nil									// @"<YOUR SESSION CALLBACK)>";
*/
//Edited By Vineeth End

//#define kOAuthConsumerKey			@"iMOXhShW1wlMb4UF9mXfA"
//#define kOAuthConsumerSecret		@"Vq7NvTTybV6INlkPbacrPIpvAbDWGR5vUJ58Klt0DU"


//#define kOAuthConsumerKey            @"AWhOwcufgaEsbuTskm9g"
//#define kOAuthConsumerSecret        @"PwHAHH8fmYCc7Zi8OCqiewJuSzFC9FwobgTcx0pLnU"

#define kOAuthConsumerKey            @"iMOXhShW1wlMb4UF9mXfA"
#define kOAuthConsumerSecret        @"Vq7NvTTybV6INlkPbacrPIpvAbDWGR5vUJ58Klt0DU"


#define kAppId						@"197176626985041"
#define kApiKey						@"ebf90614f0337661b94d67f8521af12c"
#define kApiSecret					@"02570c56424d4dc6b1fe8f30e723b6be" // @"<YOUR SECRET KEY>";
#define kGetSessionProxy			nil									// @"<YOUR SESSION CALLBACK)>";




@implementation MyMailComposeViewController

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end


@implementation UIiJotDetailViewController
@synthesize editPlayBtn;
@synthesize editShowBtn;
@synthesize editPauseBtn;
@synthesize editStopBtn;
@synthesize managedObject;
@synthesize directAccess;
@synthesize txtView;
@synthesize matchPattern;
@synthesize lblElapsedTime;
@synthesize lblElapsedTime2;
@synthesize sliderControl;
@synthesize btnKeyboard;
@synthesize btnBack;
@synthesize saveButtonOn;
@synthesize editPlayerView;
@synthesize processMessage;
@synthesize mapPendingMessage;
@synthesize imgBackground;


float currentlatitude=0;
float currentlongitude=0;

int x=0;

int pauseCountTwo=2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];


}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
  //  self.btnBack.titleLabel.text = [loc back:lang];
 //   self.shareBtn.titleLabel.text = [loc Share:lang];
    
    [self.btnBack setTitle:[loc back:lang] forState:UIControlStateNormal];
    [self.shareBtn setTitle:[loc Share:lang] forState:UIControlStateNormal];

	btnKeyboard.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height-btnKeyboard.frame.size.height/2);
    CGRect tvRect = txtView.frame;
	tvRect.origin.y = 60;//60
    tvRect.size.height=545;//345
	txtView.frame = tvRect;
//    btnKeyboard.center=CGPointMake(self.view.frame.size.width/2,txtView.frame.origin.y+txtView.frame.size.height-btnKeyboard.frame.size.height/2);
    //Edited By Vineeth
    
    /* 
    int FlagobjectForfalgNote = [self.managedObject.flag intValue];
    
    NSLog(@"self.managedObject.flag is:%@,%i",self.managedObject.flag,FlagobjectForfalgNote);
    
  
    if(FlagobjectForfalgNote==1){
        
        NSLog(@"Entered hidden");
        txtView.hidden = YES;
       
    }else{
         NSLog(@"Entered Not hidden");
        txtView.hidden = NO;
    }
    */
    
     //Edited By Vineeth end
    
    keyboardVisible = NO;
    /*
    CGRect bkRect = btnKeyboard.frame;
    bkRect.origin.y = 416;
    btnKeyboard.frame = bkRect;
    */
  
    CGRect playRect = editPlayerView.frame;
    playRect.origin.y = -10;
    editPlayerView.frame = playRect;
    [editShowBtn setImage:[UIImage imageNamed:@"edit_player_down_arrow.png"] forState:UIControlStateNormal];

    NSString* calculatedTime = [managedObject.duration stringByReplacingOccurrencesOfString:@" s" withString:@""];
    totalTime = [calculatedTime intValue];
    lblElapsedTime.text = [NSString stringWithFormat:@"00:00 / %@",[self getFormatedTime:totalTime/60 second:totalTime%60]];
    lblElapsedTime2.text = lblElapsedTime.text;
    //lblElapsedTime2.hidden = NO;
    
    NSLog(@"totalTime %d",totalTime);
    NSLog(@"lblElapsedTime.text %@",lblElapsedTime.text);

    if (saveButtonOn == NO) {
        //[self prePatternMatch];
        
        //Edited By Vineeth
        self.processMessage = [PostProcessing prePattern:managedObject.message];
        txtView.text = self.processMessage;
        
        
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
        
        
        [btnBack setTitle: [loc back:lang] forState:UIControlStateNormal];
    }
    
    

    
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillShow:) name:@"UIKeyboardWillShowNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillHide:) name:@"UIKeyboardWillHideNotification" object:nil];

}

-(void)viewDidAppear:(BOOL)animated
{
    if (matchPattern) {
        [self performSelector:@selector(patternMatch) withObject:nil afterDelay:0.5];
    }
    
   
}

- (void)dealloc
{
	[editPlayerView release];
	[btnBack release];
	[btnKeyboard release];
	[mapController release];
	[sliderControl release];
	
	[txtView release];
	[lblElapsedTime release];

	[_permissions release];
	
    [editPlayBtn release];
    [editShowBtn release];
    [editPauseBtn release];
    [editStopBtn release];
    [lblElapsedTime2 release];
    [imgBackground release];
    [_shareBtn release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (BOOL)is4InchRetina
{
    if ((![UIApplication sharedApplication].statusBarHidden && (int)[[UIScreen mainScreen] applicationFrame].size.height == 548) || ([UIApplication sharedApplication].statusBarHidden && (int)[[UIScreen mainScreen] applicationFrame].size.height == 568))
        return YES;
    
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    if([self is4InchRetina]) {
        UIImage * backgroundImage = [UIImage imageNamed:@"background-568h@2x.png"];
        self.imgBackground.image = backgroundImage;
        CGRect rect = self.view.bounds;
        rect.origin.y = -32.0;
        rect.size.height = 568.0;
        imgBackground.frame = rect;

    }
     */
	
	[sliderControl setThumbImage: [UIImage imageNamed:@"slider_thumb.png"] forState:UIControlStateNormal];
	[sliderControl setMinimumTrackImage:[UIImage imageNamed:@"slider_bar.png"] forState:UIControlStateNormal];
	[sliderControl setMaximumTrackImage:[UIImage imageNamed:@"slider_bar.png"] forState:UIControlStateNormal];
	
	sliderControl.value = 0;
	sliderControl.enabled = true;
    // Do any additional setup after loading the view from its nib.
    self.title = @"Detail";

/*
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillShow:) name:@"UIKeyboardWillShowNotification" object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillHide:) name:@"UIKeyboardWillHideNotification" object:nil];
	
 
    */

	if (shareController == nil)
	{
		shareController = [[UIShareViewController alloc] initWithNibName:@"UIShareViewController" bundle:[NSBundle mainBundle]];
	}
	[self.view addSubview:shareController.view];
	shareController.view.hidden = true;
    
    //  ........By Kamal @ alignminds...........
    if(!locationManager) {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.distanceFilter = kCLLocationAccuracyHundredMeters;//kCLDistanceFilterNone; // whenever we move
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
        currentlatitude=locationManager.location.coordinate.latitude;
        currentlongitude=locationManager.location.coordinate.longitude;
        
        [locationManager startUpdatingLocation];
    }
    //.................................
}
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    currentlatitude=newLocation.coordinate.latitude;
	currentlongitude=newLocation.coordinate.longitude;
    if(self.mapPendingMessage!=nil) {
        [self performSelectorOnMainThread:@selector(doMap:) withObject:nil waitUntilDone:NO];
        //[self doMap:mapPendingMessage];
    }
    
    [manager stopUpdatingLocation];
}

- (void)viewDidUnload
{
    
    [locationManager stopUpdatingLocation];  //By Kamal...
    if (locationManager) {
        [locationManager release];
        locationManager=nil;
    }
    
    [self setEditPlayBtn:nil];
    [self setBtnBack:nil];
    
    
     [self setBtnKeyboard:nil];
    
    
    [self setSliderControl:nil];
    [self setTxtView:nil];
    [self setLblElapsedTime:nil];
    [self setManagedObject:nil];
    [self setEditPlayerView:nil];
    [self setEditShowBtn:nil];
    [self setEditPauseBtn:nil];
    [self setEditStopBtn:nil];
    [self setLblElapsedTime2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Functions
#pragma mark -

-(IBAction) onClickShowHideKeyboard
{
	if (keyboardVisible)
		[self.txtView resignFirstResponder];
	else 
		[self.txtView becomeFirstResponder];
}

- (IBAction)sliderValuechange:(id)sender
{
    //   sliderControl.value;
    NSLog(@"sliderControl.value %f",sliderControl.value);
    
    float value=sliderControl.value;
    timerTicks=value*totalTime;
    NSLog(@"timerTicks new %d",timerTicks);
 
    
    lblElapsedTime.text = [NSString stringWithFormat:@"%@ / %@",[self getFormatedTime:(timerTicks)/60 second:(timerTicks)%60],[self getFormatedTime:totalTime/60 second:totalTime%60]];
    lblElapsedTime2.text = lblElapsedTime.text;
    //lblElapsedTime2.hidden = YES;
	double tim = timerTicks;
	double ttim = totalTime;
	double rem = tim/ttim;
	sliderControl.value = rem;
    
    player.currentTime=timerTicks;
    
}

-(IBAction) onClickEditPlayer
{
	CGRect rect = editPlayerView.frame;
	if (rect.origin.y < 0)
	{
		rect.origin.y = 32;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:editPlayerView cache:YES];
		[UIView setAnimationDuration:0.5];
		editPlayerView.frame = rect;
		[UIView commitAnimations];
		
		CGRect tvRect = txtView.frame;
		
		tvRect.origin.y = 100;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:txtView cache:YES];
		[UIView setAnimationDuration:0.5];
		txtView.frame = tvRect;
		[UIView commitAnimations];
		
        [editShowBtn setImage:[UIImage imageNamed:@"edit_player_up_arrow.png"] forState:UIControlStateNormal];
        
        //by EKBPGK Ticket #50
        
        [self performSelector:@selector(onClickPlay) withObject:nil afterDelay:1.0];
        //[self onClickPlay];
        
        //by EKBPGK Ticket #50 done
	}
	else
	{
        
        //by EKBPGK Ticket #74
        
        [NSObject cancelPreviousPerformRequestsWithTarget:self];
        [self performSelectorOnMainThread:@selector(onClickStop) withObject:nil waitUntilDone:YES];
        
       //by EKBPGK Ticket #74 done
        
		rect.origin.y = -10;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:editPlayerView cache:YES];
		[UIView setAnimationDuration:0.5];
		editPlayerView.frame = rect;
		[UIView commitAnimations];
		
		CGRect tvRect = txtView.frame;
		
		tvRect.origin.y = 60;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:txtView cache:YES];
		[UIView setAnimationDuration:0.5];
		txtView.frame = tvRect;
		[UIView commitAnimations];
        
        [editShowBtn setImage:[UIImage imageNamed:@"edit_player_down_arrow.png"] forState:UIControlStateNormal];
        
        
        //by EKBPGK Ticket #50
        
        //[self onClickStop];
        [self resetButtons];
        
        //by EKBPGK Ticket #50 done
    }
    
}

-(void) resetButtons
{
    [editPauseBtn setImage:[UIImage imageNamed:@"edit_pause.png"] forState:UIControlStateNormal];
    [editStopBtn setImage:[UIImage imageNamed:@"edit_stop.png"] forState:UIControlStateNormal];
    [editPauseBtn setImage:[UIImage imageNamed:@"edit_pause_tapped.png"] forState:UIControlStateHighlighted];
    [editStopBtn setImage:[UIImage imageNamed:@"edit_stop_tapped.png"] forState:UIControlStateHighlighted];

}

-(void) updateTime
{
	if (paused)
		return;
	timerTicks++;
    
    //by EKBPGK Ticket #2
    
    editPlayBtn.selected = NO;
    
    /*
    if (timerTicks%2 == 1) {
        editPlayBtn.selected = YES;
    }
    else
    {
        editPlayBtn.selected = NO;
    }
	*/
    
    //by EKBPGK Ticket #2 done
    
	if (totalTime <= timerTicks)
	{
		if (playerTime != nil)
		{
			[playerTime invalidate];
			playerTime = nil;
		}
		sliderControl.enabled = true;
		sliderControl.value = 0;

		lblElapsedTime.text = [NSString stringWithFormat:@"00:00 / %@",[self getFormatedTime:totalTime/60 second:totalTime%60]];
        lblElapsedTime2.text = lblElapsedTime.text;
        //lblElapsedTime2.hidden = NO;
        
        
        //by EKBPGK Ticket #2
        //editPlayBtn.selected = NO;
		
        editPlayBtn.selected = YES;
        //by EKBPGK Ticket #2 done		
        
        //by EKBPGK Ticket #74 
        [self onClickEditPlayer];
        //by EKBPGK Ticket #74 done
        
        
        return;
	}
	NSLog(@"timerTicks %d",timerTicks);
	sliderControl.enabled = true;
	lblElapsedTime.text = [NSString stringWithFormat:@"%@ / %@",[self getFormatedTime:(timerTicks)/60 second:(timerTicks)%60],[self getFormatedTime:totalTime/60 second:totalTime%60]];
    lblElapsedTime2.text = lblElapsedTime.text;
    //lblElapsedTime2.hidden = YES;
	double tim = timerTicks;
	double ttim = totalTime;
	double rem = tim/ttim;
	sliderControl.value = rem;
}

-(IBAction) onClickPause
{
    
    if(pauseCountTwo!=1)
    {
        pauseCountTwo=1;
    }
    else{
        
        pauseCountTwo=2;
    }
	if (player != nil && [player isPlaying])
	{
		paused = true;
		[player pause];
        
        
        //by EKBPGK Ticket #2
        //editPlayBtn.selected = NO;
		
        editPlayBtn.selected = YES;
		
        //
        
        
        //lblElapsedTime2.hidden = NO;
	}
    else{
        if(pauseCountTwo==1)
        {
            paused = true;
            [player pause];
            
            
        }
        else if(pauseCountTwo==2){
            
            paused=false;
            [player play];
            
        }
    }
    if(paused) {
        [editPauseBtn setImage:[UIImage imageNamed:@"edit_pause_tapped.png"] forState:UIControlStateNormal];
    } else {
        [editPauseBtn setImage:[UIImage imageNamed:@"edit_pause.png"] forState:UIControlStateNormal];
    }
    
}

-(IBAction) onClickStop
{
	paused = false;
	if (player != nil)
	{
		if ([player isPlaying])
		{
			[player stop];
			[player release];
			player = nil;
		}
		
		if (playerTime != nil)
		{
			[playerTime invalidate];
			playerTime = nil;
		}
		sliderControl.value = 0;
		sliderControl.enabled = true;
		
		timerTicks = 0;
		lblElapsedTime.text = [NSString stringWithFormat:@"00:00 / %@",[self getFormatedTime:totalTime/60 second:totalTime%60]];
        lblElapsedTime2.text = lblElapsedTime.text;
        //lblElapsedTime2.hidden = NO;
        
        
        //by EKBPGK Ticket #2
        //editPlayBtn.selected = NO;
		
        editPlayBtn.selected = YES;
		
        //by EKBPGK Ticket #2 done
	}
    
    [editStopBtn setImage:[UIImage imageNamed:@"edit_stop_tapped.png"] forState:UIControlStateNormal];
    
    //by EKBPGK Ticket #2
    [editPauseBtn setImage:[UIImage imageNamed:@"edit_pause.png"] forState:UIControlStateNormal];
    //
    //by EKBPGK Ticket #2 done
    
    //by EKBPGK Ticket #50
    
    // [self onClickEditPlayer];
    
    //by EKBPGK Ticket #50 done
}
-(void) onClickPlay
{
    
    [self resetButtons];
    
	if (paused)
	{
		if (player != nil)
			[player play];
		paused = false;
        //lblElapsedTime2.hidden = YES;
		return;
	}
	
	UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;     
	AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,          
							 sizeof (audioRouteOverride),&audioRouteOverride); 
	
	paused = false;
	if (player != nil && [player isPlaying])
	{
        [self onClickPause];
//		[player stop];
//		[player release];
//		player = nil;
//		
//		if (playerTime != nil)
//		{
//			[playerTime invalidate];
//			playerTime = nil;
//		}
//		sliderControl.value = 0;
//		sliderControl.enabled = true;
//
//		timerTicks = 0;
//        
//        
//        //by EKBPGK Ticket #2
//        //editPlayBtn.selected = NO;
//		
//        editPlayBtn.selected = YES;
//		
//        //
//        
//        
//		//lblElapsedTime2.hidden = NO;
//        lblElapsedTime.text = [NSString stringWithFormat:@"00:00 / %@",[self getFormatedTime:totalTime/60 second:totalTime%60]];
//        lblElapsedTime2.text = lblElapsedTime.text;
	}
	else 
	{
		NSString* calculatedTime = [managedObject.duration stringByReplacingOccurrencesOfString:@" s" withString:@""];
		totalTime = [calculatedTime intValue];
		
		NSString* destFile = [NSString stringWithFormat:@"%@/%@.m4a", RECORDINGS_FOLDER, managedObject.name];
		if ([[NSFileManager defaultManager] fileExistsAtPath:destFile]) 
		{    
			if (player != nil)
			{
				[player release];
				player = nil;
			}
			
			NSError* error = nil;
			player = [[AVAudioPlayer alloc] initWithContentsOfURL:
					  [NSURL fileURLWithPath:destFile] error:&error];
			player.volume = 0.8f;
			AudioSessionSetActive(TRUE);
			// To minimize lag time before start of output, preload buffers      
			[player prepareToPlay];
			
			// Play the sound once (set negative to loop)
			[player setNumberOfLoops:0];
			
				//DLog(@"playing ");
			[player play];    

			if (playerTime != nil)
			{
				[playerTime invalidate];
				playerTime = nil;
			}
			sliderControl.enabled = true;
			sliderControl.value = 0;
			sliderControl.maximumValue = 1;
            lblElapsedTime.text = [NSString stringWithFormat:@"00:00 / %@",[self getFormatedTime:totalTime/60 second:totalTime%60]];
            lblElapsedTime2.text = lblElapsedTime.text;
            //lblElapsedTime2.hidden = YES;
			playerTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
			timerTicks = 0;
            editPlayBtn.selected = NO;
            
            
		}
		else 
		{
			DLog(@"onClickPlay file not exist");
		}
	}
	
}

-(void) onClickBack
{
	paused = false;
	shareController.view.hidden = true;
	
	if (player != nil && [player isPlaying])
	{
		[self onClickPlay];
	}
    
    if (toDelete) {
        [self deleteThis];
        [self dismissViewControllerAnimated:YES completion:^{
            // Nothing to do
        }];
        return;
    }
    
    if (saveButtonOn == YES) {
        self.processMessage = txtView.text;
        managedObject.message = self.processMessage;
        [self updateThis];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Saved") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
    }
    
    self.processMessage = nil;

	[self dismissViewControllerAnimated:YES completion:^{
        // Nothing to do
    }];
}

-(void) onClickShare
{
    
    NSLog(@"onClickShare in UIiJotDetailViewController and testView.text is:%@",txtView.text);
    
	if (player != nil && [player isPlaying])
		[self onClickPlay];
	
	[txtView resignFirstResponder];

	[shareController reloadCustomTable];
	[self.view addSubview:shareController.view];
	shareController.managedObject = self.managedObject;
    shareController.delegate = self;
    NSString* msg =[NSString stringWithString: txtView.text];
    shareController.msg = msg;
	shareController.view.hidden = true;
	[self.view bringSubviewToFront:shareController.view];
    
    
	
    //self.processMessage = txtView.text;
	
	CGRect rect = shareController.view.frame;
	rect.origin.y = -568;
	shareController.view.frame = rect;
	shareController.view.hidden = false;
	rect.origin.y = 0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:shareController.view cache:YES];
	[UIView setAnimationDuration:0.5];
	shareController.view.frame = rect;
	[UIView commitAnimations];

	START_EXCEPTION
	[shareController.customTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
	END_EXCEPTION
	
	return;
}


#pragma mark -
#pragma mark Pattern Match
#pragma mark -


-(void) calenderThis:(NSString*) message{


    [self eventAddButtonPressed];

}


/*


-(void) calenderThis:(NSString*) message
{
 
    //Create the Event Store
    EKEventStore *eventStore = [[EKEventStore alloc]init];
    
    //Check if iOS6 or later is installed on user's device *******************
    if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        
        //Request the access to the Calendar
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted,NSError* error){
            
            //Access not granted-------------
            if(!granted){
                NSString *message = @"Hey! I Can't access your Calendar... check your privacy settings to let me in!";
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:message
                                                                  delegate:self
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil,nil];
              
                dispatch_async(dispatch_get_main_queue(), ^
                {
                    [alertView show];
                }
                               );
                
                //Access granted------------------
            }
            else{
                
               [self createEvent:eventStore:message];

            }
        }];
    }
    
    //Device prior to iOS 6.0  *********************************************
    else{
        [self createEvent:eventStore:message];
    }

    
}
 
 */


-(void)createEvent:(EKEventStore*)eventStore:(NSString *)message
{
    [message retain];
    NSString* messageTitle = @"";
    NSString* messageBody = @"";
    EKRecurrenceRule *rule = nil;
	NSDate* date = [self getDateFromMessage:message title:&messageTitle body:&messageBody rule:&rule];
    DLog(@"Calender Date = %@",date);
    
    if(date!=nil) {
        [messageBody retain];
      //  EKEventStore* eventStore = [[[EKEventStore alloc] init] autorelease];
        EKEvent *event = [EKEvent eventWithEventStore:eventStore];
        [event setCalendar:[eventStore defaultCalendarForNewEvents]];
        
        event.title = messageTitle;
        
        if (rule!=nil) {
            [event addRecurrenceRule:rule];
        }
        [event addAlarm:[EKAlarm alarmWithRelativeOffset:-15*60]];
        
        event.startDate = date;
        DLog(@"Calender Start Date = %@",event.startDate);
        event.endDate = [[[NSDate alloc] initWithTimeInterval:(60*60) sinceDate:date] autorelease];
        DLog(@"Calender End Date = %@",event.startDate);
        
        
        NSError *err;
        [eventStore saveEvent:event span:EKSpanThisEvent error:&err];

        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
        
        //find current data
        NSDate *now = [[NSDate alloc] init];
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [formatter setLocale:usLocale];
        [formatter setDateFormat:@"MMMM dd, yyyy h:mm aa"];
        NSString *dateStr = [formatter stringFromDate:now];
        [now release];
        
        
        UIAlertView *alert=[[[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[NSString stringWithFormat:[loc CalendarEventAtAdded:lang],messageBody,dateStr] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil] autorelease];
        [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
     
    }
    [self onClickBack];
}

-(NSDate*) getDateFromMessage:(NSString*) message title:(NSString**) title body:(NSString**) body rule:(EKRecurrenceRule**) rule
{

    NSTimeInterval seconds = 24*60*60;
    
 //   NSTimeInterval seconds = 2*60;

    MyDatePattern* pat = [MyDatePattern sharedObject];
    NSLog(@"pattern is:%@",pat);
    RemindMeData* remindData = [pat quickSearch:message];
    NSLog(@"Data is:%@",remindData);
    *title = pat.message;
    NSDate* date = [remindData getDate];
    NSDate* now = [NSDate date];
    bool noDate = false;
    if (date == nil) {
        date = now;
        noDate = true;
    }
    DLog(@"Calender Date = %@",date);

    if ((pat.hasDate==NO && pat.hasTime==YES) || (pat.isTomorrow && pat.hasDate == NO) || (pat.isToday && pat.hasDate==NO && pat.hasTime==NO) || (noDate && !(pat.isToday || pat.isTomorrow))) {
        date = [NSDate dateWithTimeInterval:seconds sinceDate:date];
    }

    *title = [UtilityManager firstCapitalString:*title];
    if (pat.isToday && (pat.hasTime == NO || [date compare:now]==NSOrderedAscending)) {
        
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"A valid Time must be specified when using \"Today\"") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
        [alert show];
        [alert release];
        return nil;
    } else if(!noDate && [date compare:now]==NSOrderedAscending) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Date set is invalid. Please try again.") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
        [alert show];
        [alert release];
        return nil;
    }

    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale:usLocale];
    [formatter setDateFormat:@"MMMM dd, yyyy h:mm aa"];
    NSString *dateStr = [formatter stringFromDate:date];
    *body = [*body stringByAppendingFormat:@"%@, %@", *title, dateStr];
    
    if (pat.repeatStyle != -1) {
        EKRecurrenceEnd *end = nil;
        *rule = [[EKRecurrenceRule alloc] init];
        switch (pat.repeatStyle) {
            case 0:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyDaily interval:1 end:end];
                break;
            case 1:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:1 end:end];
                break; 
            case 2:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:2 end:end];
                break;
            case 3:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyMonthly interval:1 end:end];
                break;
            case 4:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyYearly interval:1 end:end];
                break;
            default:
                break;
        }
    }
    
    return date;
}
-(NSDate*) getReminderDateFromMessage:(NSString*) message title:(NSString**) title body:(NSString**) body rule:(EKRecurrenceRule**) rule
{
    
    NSTimeInterval seconds = 24*60*60;
    
    //   NSTimeInterval seconds = 2*60;
    
    MyDatePattern* pat = [MyDatePattern sharedObject];
    NSLog(@"pattern is:%@",pat);
    RemindMeData* remindData = [pat quickSearch:message];
    NSLog(@"Data is:%@",remindData);
    *title = pat.message;
    NSDate* date = [remindData getDate];
    NSDate* now = [NSDate date];
    bool noDate = false;
    if (date == nil) {
        date = now;
        noDate = true;
    }
    DLog(@"Calender Date = %@",date);
    
    if ((pat.hasDate==NO && pat.hasTime==YES) || (pat.isTomorrow && pat.hasDate == NO) || (pat.isToday && pat.hasDate==NO && pat.hasTime==NO) || (noDate && !(pat.isToday || pat.isTomorrow))) {
        date = [NSDate dateWithTimeInterval:seconds sinceDate:date];
    }
    
    *title = [UtilityManager firstCapitalString:*title];
    if (pat.isToday && (pat.hasTime == NO || [date compare:now]==NSOrderedAscending)) {
        
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"A valid Time must be specified when using \"Today\"") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
        [alert show];
        [alert release];
        return nil;
    } else if(!noDate && [date compare:now]==NSOrderedAscending) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Date set is invalid. Please try again.") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
        [alert show];
        [alert release];
        return nil;
    }
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale:usLocale];
    [formatter setDateFormat:@"MMMM dd, yyyy h:mm aa"];
    NSString *dateStr = [formatter stringFromDate:date];
    *body = [*body stringByAppendingFormat:@"%@,for %@", *title, dateStr];
    
    if (pat.repeatStyle != -1) {
        EKRecurrenceEnd *end = nil;
        *rule = [[EKRecurrenceRule alloc] init];
        switch (pat.repeatStyle) {
            case 0:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyDaily interval:1 end:end];
                break;
            case 1:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:1 end:end];
                break;
            case 2:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:2 end:end];
                break;
            case 3:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyMonthly interval:1 end:end];
                break;
            case 4:
                *rule = [*rule initRecurrenceWithFrequency:EKRecurrenceFrequencyYearly interval:1 end:end];
                break;
            default:
                break;
        }
    }
    
    return date;
}


///////////////////////////////////////////////////////////
-(void)remindMe :(NSString*) message
{
    //Create the Event Store
    EKEventStore *eventStore = [[EKEventStore alloc]init];
    
    //Check if iOS6 or later is installed on user's device *******************
    if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        
        //Request the access to the Calendar
        [eventStore requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted,NSError* error){
            
            //Access not granted-------------
            if(!granted){
                NSString *message = @"Hey! I Can't access your Reminder... check your privacy settings to let me in!";
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning"
                                                                   message:message
                                                                  delegate:self
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil,nil];
                
                dispatch_async(dispatch_get_main_queue(), ^
                               {
                                   [alertView show];
                               }
                               );
                
                //Access granted------------------
            }
            else{
                
                [self createReminderEvent:eventStore:message];
                
            }
        }];
    }
    
    //Device prior to iOS 6.0  *********************************************
    else{
        [self createPeriorReminderEvent:eventStore:message];
    }
    

}





-(void)createReminderEvent:(EKEventStore*)eventStore:(NSString *)message
{
    [message retain];
    
    EKReminder *reminder = [EKReminder
                            reminderWithEventStore:eventStore];
    
    if(reminder)
    {
        
        reminder.calendar = [eventStore defaultCalendarForNewReminders];
        
        //  NSDate *date = [_myDatePicker date];
        NSString* messageTitle = @"";
        NSString* messageBody = @"";
        EKRecurrenceRule *rule = nil;
        
        NSDate* date = [self getReminderDateFromMessage:message title:&messageTitle body:&messageBody rule:&rule];
        if(date)
        {
            reminder.title = messageTitle;
            
            EKAlarm *alarm = [EKAlarm alarmWithAbsoluteDate:date];
            
            
            [reminder addAlarm:alarm];
            
            NSError *error = nil;
            
            [eventStore saveReminder:reminder commit:YES error:&error];
            
            if (error)
                NSLog(@"error = %@", error);
            else
            {
                UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[NSString stringWithFormat: LOC(@"Reminder Set: %@"),messageBody]  delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil] autorelease];
                [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
//                [alert show];
//                [alert release];
            }
        }
        [self onClickBack]; 
    }
    else
    {
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc UnabletoaddReminder:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
    }
    
}
-(void)createPeriorReminderEvent:(EKEventStore*)eventStore:(NSString *)message
{
    [message retain];
    
    NSLog(@"Entered in to remindMe");
    NSLog(@"Message at First Time:%@",message);
    
	UIApplication* app = [UIApplication sharedApplication];
	UILocalNotification* alarm = [[[UILocalNotification alloc] init] autorelease];
	if (alarm)
	{
        NSString* messageTitle = @"";
        NSString* messageBody = @"";
        EKRecurrenceRule *rule = nil;
        
        NSDate* date = [self getReminderDateFromMessage:message title:&messageTitle body:&messageBody rule:&rule];
        
        if(date) {
            DLog(@"Reminder Date = %@",date);
            
            alarm.alertBody = messageTitle;
            
            DLog(@"Message = %@",messageBody);
            
            alarm.repeatInterval = 0;
            alarm.soundName = UILocalNotificationDefaultSoundName;
            
            DLog(@"Reminder Date = %@",date);
            alarm.fireDate = date;
            
            [app scheduleLocalNotification:alarm];
            
            
            UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[NSString stringWithFormat: LOC(@"Reminder Set: %@"),messageBody]  delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil] autorelease];
            [alert performSelectorOnMainThread:@selector(show) withObject:nil waitUntilDone:YES];
//            [alert show];
//            [alert release];
        }
        
        [self onClickBack];
	}
	else
	{
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc UnabletoaddReminder:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
    
    NSLog(@"How many time repeats this function:%i",x);
}
/////////////////////////////////////////////
//-(void) remindMe:(NSString*) message
//{	
//    
//    
//    NSLog(@"Entered in to remindMe");
//    NSLog(@"Message at First Time:%@",message);
//    
//	UIApplication* app = [UIApplication sharedApplication];
//	UILocalNotification* alarm = [[[UILocalNotification alloc] init] autorelease];
//	if (alarm)
//	{
//        NSString* messageTitle = @"";
//        NSString* messageBody = @"";
//        EKRecurrenceRule *rule = nil;
//        
//        NSDate* date = [self getDateFromMessage:message title:&messageTitle body:&messageBody rule:&rule];
//        
//        if(date) {
//            DLog(@"Reminder Date = %@",date);
//            
//            alarm.alertBody = messageTitle;
//            
//            DLog(@"Message = %@",messageBody);
//            
//            alarm.repeatInterval = 0;
//            alarm.soundName = UILocalNotificationDefaultSoundName;
//            
//            DLog(@"Reminder Date = %@",date);
//            alarm.fireDate = date;
//            
//            [app scheduleLocalNotification:alarm];
//            
//            
//            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[NSString stringWithFormat: LOC(@"Reminder Set: %@"),messageBody]  delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//        }
//        
//        [self onClickBack];
//	}	
//	else 
//	{
//        SettingsManager* settings = [SettingsManager sharedManager];
//        NSString * lang = settings.language;
//        Localizer* loc = [[Localizer alloc] init];
//		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc UnabletoaddReminder:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
//		[alert show];
//		[alert release];
//	}
//
//    NSLog(@"How many time repeats this function:%i",x);
//  
//}

/*
-(void) onClickMapBack
{
    [self onClickBack];
}
 */

-(void)openMapsWithString:(NSURL *)url
{
    DLog(@"url = %@",url);
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}


-(void) doMap:(NSString*) message;
{
	//if (mapController == nil)
	//	mapController = [[UIMapsViewController alloc] initWithNibName:@"UIMapsViewController" bundle:[NSBundle mainBundle]];
    //else
    //    [mapController dismissModalViewControllerAnimated:NO];
    
    //mapController.delegate = self;
	//[mapController startLocation:message];
	//[self presentModalViewController:mapController animated:YES];
    
   // message=@"";
    
    if(message==nil && mapPendingMessage!=nil) {
        message = mapPendingMessage;
    }
    mapPendingMessage = nil;
    NSLog(@"message in doMap in UIijtDetailViewController is: %@",message);
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString *urlString;
    if(settings.mapIndex==0)
    {
     urlString = [[NSString stringWithFormat:@"http://maps.apple.com/maps?sll=%g,%g&radius=25miles&z=14&mrt=all&q=%@",currentlatitude,currentlongitude,message] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];   
    }
   else
   {
     urlString = [[NSString stringWithFormat:@"http://maps.google.com/maps?sll=%g,%g&radius=25miles&z=14&mrt=all&q=%@",currentlatitude,currentlongitude,message] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   }
    
    //NSString *urlString = [[NSString stringWithFormat:@"http://maps.apple.com/maps?sll=%g,%g&radius=25miles&z=14&mrt=all&q=%@",currentlatitude,currentlongitude,message] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   // NSString *urlString = [[NSString stringWithFormat:@"https://google-developers.appspot.com/maps/documentation/javascript/examples/map-geolocation?z=14&q=%@",message] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //https://google-developers.appspot.com/maps/documentation/javascript/examples/map-geolocation
    
    
    
    /*NSString *urlString = [[NSString stringWithFormat:@"http://wordpress.com"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  */  
    //DLog(@"urlString = %@",urlString);
    NSURL *url = [NSURL URLWithString:urlString];
    
    //[self performSelector:@selector(openMapsWithString:) withObject:url afterDelay:2];
    
    NSLog(@"url in doMap in UIijtDetailViewController is: %@",url);
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
   
    //[self onClickBack];
}

-(void) onClickSearchBack
{
    [self onClickBack];
}

-(void) doSearch:(NSString*) message
{

	if (searchController == nil)
		searchController = [[UISearchViewController alloc] initWithNibName:@"UISearchViewController" bundle:[NSBundle mainBundle]];
    //else
    //    [searchController dismissModalViewControllerAnimated:NO];
    
    searchController.delegate = self;
	[self presentViewController:searchController animated:YES completion:^{
        //Nothing to do
    }];
	[searchController loadWebPage:message];
}

- (void) doCopy:(NSString*) message;
{
    UIPasteboard* past = [UIPasteboard generalPasteboard];
    
    [past setValue:message forPasteboardType:@"public.utf8-plain-text"];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc Notecopied:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
    [alert show];
    [alert release];
}

-(void) sendSMS:(NSString*) message;
{
	MFMessageComposeViewController *controller = [[[MFMessageComposeViewController alloc] init] autorelease];
	controller.delegate = self;
	if([MFMessageComposeViewController canSendText])
	{
		controller.messageComposeDelegate = self;
		message = [UtilityManager firstCapitalString:message];
		NSString* str = [message stringByReplacingOccurrencesOfString:@" " withString:@"&nbsp;"];
		str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@"<br>"];
		str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@"<br>"];
		controller.body = str;
		//[self dismissModalViewControllerAnimated:NO];
		[self presentViewController:controller animated:YES completion:^{
            //Nothing to do
        }];
	}
	else 
	{
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc CantsendSMS:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}

-(void) sendEmail:(NSString*) message;
{
	//	self.textMessage = str;
	if ([MFMailComposeViewController canSendMail])
	{
		MyMailComposeViewController *mailViewController = [[MyMailComposeViewController alloc] init];
		mailViewController.mailComposeDelegate = self;
		[mailViewController setSubject:LOC(@"app.name")];
        
		//NSString* message = managedObject.message;
		
		EmailData* data = [[EmailData alloc] init:message];
		
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
        
		NSString* body = [UtilityManager firstCapitalString:data.strMessage];
        //if (isEmailThis)
        body = [body stringByAppendingFormat:[loc Sentby:lang], LOC(@"app.name")];
		if ([data.toNumber length] != 0)
			[mailViewController setToRecipients:[NSArray arrayWithObjects:data.toNumber, nil]];
		[mailViewController setMessageBody:body isHTML:NO];
		[mailViewController setSubject:[UtilityManager firstCapitalString:data.strSubject]];
		[self presentViewController:mailViewController animated:YES completion:^{
            //Nothing to do
        }];
		[mailViewController release];
		[data release];
		
	}
	else
	{
		SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc YourEmailNotConfigured:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
		
	}
}

-(void) sendTweet:(NSString*) message;
{
        //by EKBPGK Ticket #65
    /*if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *sheet=[[SLComposeViewController alloc] init];
        sheet=[SLComposeViewController composeViewControllerForServiceType: SLServiceTypeTwitter];
        [sheet setInitialText:message]; //by EKBPGK Ticket #55
        sheet.completionHandler = ^(SLComposeViewControllerResult result)
        {
            // Dismiss the controller
            [self dismissViewControllerAnimated:YES completion:^{
                //Nothing to do
            }];
        };
        [self presentViewController:sheet animated: YES completion: nil];
        sheet=nil;
    }*/
    
    if(NSClassFromString(@"SLComposeViewController") != nil)
    {
    SLComposeViewController *composeController = [SLComposeViewController
                                                  composeViewControllerForServiceType:SLServiceTypeTwitter];
           //by EKBPGK Ticket #55    
    [composeController setInitialText:message];
              //by EKBPGK Ticket #55   
    composeController.completionHandler = ^(SLComposeViewControllerResult result)
    {
        

    //    [self viewWillAppear:YES];
        
         [composeController dismissViewControllerAnimated:YES completion:nil];
        CGRect tvRect = txtView.frame;
       tvRect.origin.y = 60;
        tvRect.size.height=345;
        txtView.frame = tvRect;
      //  [self viewWillAppear:YES];
        

//by EKBPGK Ticket
        // Dismiss the controller
        /*[self dismissViewControllerAnimated:YES completion:^{
            //Nothing to do
           	CGRect tvRect = txtView.frame;
            tvRect.origin.y = 60;
            txtView.frame = tvRect;

        }];*/
        
//
    };
    
    [self presentViewController:composeController
                       animated:YES completion:nil];
    
    NSLog(@"twitter");
    }
        //by EKBPGK Ticket #65
}

-(void) sendFacebook:(NSString*) message;
{
    
//by EKBPGK Ticket #65
    
     /* if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
          {
              SLComposeViewController *sheet=[[SLComposeViewController alloc] init];
              sheet=[SLComposeViewController composeViewControllerForServiceType: SLServiceTypeFacebook];
              [sheet setInitialText:message]; //by EKBPGK Ticket #55
              sheet.completionHandler = ^(SLComposeViewControllerResult result)
              {
                  // Dismiss the controller
                  [self dismissViewControllerAnimated:YES completion:^{
                      //Nothing to do
                  }];
              };
              [self presentViewController:sheet animated: YES completion: nil];
              sheet=nil;
          }*/
   if(NSClassFromString(@"SLComposeViewController") != nil)
       {
            
            SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
             //by EKBPGK Ticket #55
            [composeController setInitialText:message];
           //by EKBPGK Ticket #55
          composeController.completionHandler = ^(SLComposeViewControllerResult result)
            {
                
                //by EKBPGK Ticket
                // [self viewWillAppear:YES];
                
                [composeController dismissViewControllerAnimated:YES completion:nil];
                CGRect tvRect = txtView.frame;
                tvRect.origin.y = 60;
                tvRect.size.height=345;
                txtView.frame = tvRect;
                // [self viewWillAppear:YES];
                
               // Dismiss the controller
                /*[self dismissViewControllerAnimated:YES completion:^{
                                   //Nothing to do
                                   CGRect tvRect = txtView.frame;
                                   tvRect.origin.y = 60;
                                   txtView.frame = tvRect;
                               }];*/
            
                //
           
               };
          
          [self presentViewController:composeController
            animated:YES completion:nil];
            
            NSLog(@"faceBook");
            }
    //by EKBPGK Ticket #65
}
-(void)onClickWordPressBack
{
    [self onClickBack];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self onClickBack];
    }
}

-(void) onWordPress:(NSString*) message 
{
    NSMutableDictionary *tokenDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"wordpressTokenkey"];
    if (tokenDict) {
        NSString *username = [tokenDict objectForKey:@"username"];
        NSString *password = [tokenDict objectForKey:@"password"];
        if ([[WordpressManager sharedManager] login:username password:password])
        {
            //NSString* tmp = processMessage;
            WordpressData* data = [[WordpressData alloc] init:message];
            
            [[WordpressManager sharedManager] post:data.strTitle message:data.strMessage];
            [[WordpressManager sharedManager] saveSettings];
            SettingsManager* settings = [SettingsManager sharedManager];
            NSString * lang = settings.language;
            Localizer* loc = [[Localizer alloc] init];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc successefulPostToWordpress:lang] delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
            [alert show];
            [alert release];
            
            [self onClickBack];
            return;
        }
    }
    else
    {
        
        //Added By Vineeth
        /*
        NSString *urlString = [[NSString stringWithFormat:@"http://wordpress.com"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
        NSURL *url = [NSURL URLWithString:urlString];
        NSLog(@"url in doMap in UIijtDetailViewController is: %@",url);
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
            
        }
         */
        
        UISettingsAddAccountViewController* cont = [[UISettingsAddAccountViewController alloc] initWithNibName:@"UISettingsAddAccountViewController" bundle:[NSBundle mainBundle]];
        cont.delegate = self;
        cont.customTitle = LOC(@"Wordpress");
        cont.strTitle = @"";
        
        cont.strContent = processMessage;
        [self presentViewController:cont animated:YES completion:^{
            //Nothing to do
        }];
        [cont release];


        
        //Commented By Vineeth
        /*
        UISettingsAddAccountViewController* cont = [[UISettingsAddAccountViewController alloc] initWithNibName:@"UISettingsAddAccountViewController" bundle:[NSBundle mainBundle]];
        cont.customTitle = LOC(@"Wordpress");
        cont.strTitle = @"";
        //NSString * message = managedObject.message;
        cont.delegate = self;
        
        cont.strContent = processMessage;
        //[self dismissModalViewControllerAnimated:NO];
        [self presentModalViewController:cont animated:YES];
        [cont release];
         */
    }
}

- (void)updateThis
{
    
    //if(managedObject) managedObject.message = @"Add event";
    NSLog(@"Entered in to updateThis%@",managedObject);
    if (managedObject != nil)
	{
        int FlagObject = [self.managedObject.flag intValue];
        NSLog(@"self.managedObject.flag is:%@,%i",self.managedObject.flag,FlagObject);
        NSString* outputString = self.processMessage;
        if(FlagObject==1){
            NSString *formatString = self.processMessage;
            NSString *paddingString = [[NSString string] stringByPaddingToLength: 10 withString: @"[Flagged] " startingAtIndex: 0];
            NSLog(@"FIrst:%@  Second:%@",formatString, paddingString);
            outputString=[NSString stringWithFormat:@"%@\n\n\n\n\n%@", formatString,paddingString];
            NSLog(@"Third string 3 is:%@",outputString);
            NSLog(@"Third string 2is:%@",[NSString stringWithFormat:@"%@\n\n\n\n\n%@", formatString,paddingString]);
            //managedObject.message = txtViewStringWhenFlagged;
            
        }
        
        NSLog(@"UIijotDetailViewController- In update this text is:%@",outputString);
        NSString* sourceFile = [NSString stringWithFormat:@"%@/%@.txt", RECORDINGS_FOLDER, managedObject.name];
        NSError* error = nil;
        NSFileManager* file = [NSFileManager defaultManager];
        if (![file removeItemAtPath:sourceFile error:&error])
        {
            DLog(@"Error in copying = %@", [error description]);
        }
        NSLog(@"Third string 3txtViewStringWhenFlagged is:%@",outputString);
        [outputString writeToFile:sourceFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
        DBManager* manager = [DBManager sharedManager];
        [manager saveContext];
        //managedObject.message = self.processMessage;
	}
}

- (void)deleteThis
{
    if (managedObject == nil) {
        return;
    }
    
    DBManager* manager = [DBManager sharedManager];
    
	NSManagedObjectContext *context = nil;
	context = [manager managedObjectContext];
    
	NSFileManager* file = [NSFileManager defaultManager];
	NSString* filePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
	if ([file fileExistsAtPath:filePath isDirectory:NO])
	{
		[file removeItemAtPath:filePath error:nil];
	}
	
	NSString* filePathText = [NSString stringWithFormat:@"%@/%@.txt",DOCUMENTS_FOLDER ,managedObject.name];
	
	if ([file fileExistsAtPath:filePathText isDirectory:NO])
	{
		[file removeItemAtPath:filePathText error:nil];
	}
	[context deleteObject:managedObject];
    [manager saveContext];
    self.managedObject = nil;
}

-(void) prePatternMatch
{
    NSLog(@"Entered in to prePatternMatch-UliJotDetailVIewController");
    NSString* textVal = @"";
    if (managedObject!= nil)
	{
		textVal = managedObject.message;
        if (matchPattern == NO) {
            ;
        } else {
            textVal = [PostProcessing prePattern:textVal];
        }
    }  
    if (saveButtonOn==YES && [UtilityManager containsString:textVal match:@"#"])
    {
        [self updateThis];
    } else if(saveButtonOn==NO) {
        txtView.text = textVal;
    }
}

-(void) patternMatch
{	
	if (managedObject!= nil)
	{
        matchPattern = NO;
        toDelete = YES;
		NSString* textVal = managedObject.message; 
        self.processMessage = textVal;
        bool isFlagged = false;

        SettingsManager* settings = [SettingsManager sharedManager];
        if (settings.autoSave) {
            toDelete = NO;
        }
        
        if ([UtilityManager containsString:textVal match:@"hashtag"])
        {
            textVal = [UtilityManager replaceInsensitive:textVal what:@"hashtag" with:@"#"];
            
        }
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		if ([UtilityManager hasStartOREnd:textVal match:[loc flagthis:lang]] || [UtilityManager hasStartOREnd:textVal match:@"mark this"])
		{
            if ([UtilityManager hasStartOREnd:managedObject.message match:[loc flagthis:lang]])
            {
                textVal =[UtilityManager removeMatch:textVal match:[loc flagthis:lang]];
            }
            else if ([UtilityManager hasStartOREnd:managedObject.message match:@"mark this"])
            {
                textVal =[UtilityManager removeMatch:textVal match:@"mark this"];
            }
			managedObject.flag = [NSNumber numberWithBool:TRUE];
            isFlagged = true;
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Note Flagged") delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
            [alert show];
            [alert release];
            toDelete = NO;
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc copythis:lang]])
		{
            textVal =[UtilityManager removeMatch:textVal match:[loc copythis:lang]];
            [self doCopy:textVal];
            toDelete = NO;
		}
		else if ([UtilityManager hasStartOREnd:textVal match:@"facebook this"])
		{
			[self sendFacebook:[UtilityManager removeMatch:textVal match:@"facebook this"]];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc emailthis:lang]] || [UtilityManager hasStartOREnd:textVal match:[loc emailthis:lang]])
		{
            NSString* tmp = textVal;
            if ([UtilityManager hasStartOREnd:tmp match:[loc emailthis:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc emailthis:lang]];
            }
            else if ([UtilityManager hasStartOREnd:tmp match:@"email this"])
            {
                tmp =[UtilityManager removeMatch:tmp match:@"email this"];
            }
			[self sendEmail:tmp];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc twitterthis:lang]])
		{
			[self sendTweet:[UtilityManager removeMatch:textVal match:[loc twitterthis:lang]]];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc wordpressthis:lang]] || [UtilityManager hasStartOREnd:textVal match:[loc wordpressthis:lang]])
		{
            NSString* tmp = textVal;
            if ([UtilityManager hasStartOREnd:tmp match:[loc wordpressthis:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc wordpressthis:lang]];
            }
            else if ([UtilityManager hasStartOREnd:tmp match:[loc wordpressthis:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc wordpressthis:lang]];
            }
			[self onWordPress:tmp];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc addEvent:lang]] || [UtilityManager hasStartOREnd:textVal match:[loc addEvent:lang]])
		{
            
            NSString* message = [MyDatePattern normalizeTime:textVal];
            if([message compare:textVal]!=NSOrderedSame) {
                self.processMessage = message;
                textVal = message;
                [self updateThis];
            }
            
            NSString* tmp = textVal;
            if ([UtilityManager hasStartOREnd:tmp match:[loc addEvent:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc addEvent:lang]];
            }
            else if ([UtilityManager hasStartOREnd:tmp match:[loc addEvent:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc addEvent:lang]];
            }
			[self calenderThis:tmp];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc addEvent:lang]] || [UtilityManager hasStartOREnd:textVal match:@"message this"]||[UtilityManager hasStartOREnd:textVal match:@"text this"])
		{
            NSString* tmp = textVal;
            if ([UtilityManager hasStartOREnd:tmp match:[loc textthis:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc textthis:lang]];
            }
            else if ([UtilityManager hasStartOREnd:tmp match:[loc textthis:lang]])
            {
                tmp =[UtilityManager removeMatch:tmp match:[loc textthis:lang]];
            }
			[self sendSMS:textVal];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc find:lang]])//Map Find
		{
            self.mapPendingMessage = [UtilityManager removeMatch:textVal match:[loc find:lang]];
            CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
            if([CLLocationManager locationServicesEnabled] && status==kCLAuthorizationStatusNotDetermined) {
                [locationManager startUpdatingLocation];
            } else if ((![CLLocationManager locationServicesEnabled])
                || (status == kCLAuthorizationStatusRestricted)
                || (status == kCLAuthorizationStatusDenied))
            {
                // Send the user to the location settings preferences
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"prefs:root=LOCATION_SERVICES"]];
            } else {
                [self doMap:mapPendingMessage];
            }
		}
		else if ([UtilityManager hasStartOREnd:textVal match:[loc searchFor:lang]])
		{
			[self doSearch:[UtilityManager removeMatch:textVal match:[loc searchFor:lang]]];
		}
		else if ([UtilityManager hasStartOREnd:textVal match:@"remind me"])
		{
            NSString* message = [MyDatePattern normalizeTime:textVal];
            if([message compare:textVal]!=NSOrderedSame) {
                textVal = message;
                self.processMessage = message;
                [self updateThis];
            }
            NSString* tmp = textVal;
            tmp =[UtilityManager removeMatch:textVal match:@"remind me"];
            self.processMessage = tmp;
			//[self remindMe:tmp];
           
            // ankur code
            [self eventAddButtonPressed];
            
		}
        else
        {
            toDelete = NO;
        }
        
        self.processMessage = textVal;
        
        if(self.processMessage==nil || [self.processMessage length] == 0) 
        {
            self.processMessage = LOC(@"home.no.result.found");
        }
        
        txtView.text = [UtilityManager firstCapitalString:self.processMessage];
        if(settings.autoSave || isFlagged) {
            [self updateThis];
        }
        self.processMessage = nil;
	}
}

#pragma mark -
#pragma mark Email Composer delegate
#pragma mark -

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:^{
        //Nothing to do
    }];
     SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	switch (result) {
		case MessageComposeResultCancelled:
				//NSLog(@"Cancelled");
			break;
		case MessageComposeResultFailed:
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc ErrorsendingSMS:lang] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
			[alert show];
			[alert release];
		}
			break;
		case MessageComposeResultSent:
		{
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc MessageSent:lang] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
			[alert show];
			[alert release];
            
            [self onClickBack];
		}
			break;
		default:
			break;
	}
	//[controller dismissModalViewControllerAnimated:YES];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissViewControllerAnimated:YES completion:^{
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];

        switch (result) {
            case MFMailComposeResultCancelled:
                //DLog(@"Cancelled");
                break;
            case MFMailComposeResultFailed:
            {
                DLog(@"sending error = %@", [error description]);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc Emailerror:lang] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
                [alert show];
                [alert release];
            }
                break;
            case MFMailComposeResultSent:
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Email Sent.") delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles: nil];
                [alert show];
                [alert release];
                [self onClickBack];
            }
                break;
            default:
                break;
        }
    }];
}




#pragma mark Keyboard delegates
-(void) keyboardWillHide:(NSNotification*) notif
{
    NSDictionary *userinfo = notif.userInfo;
    
    if (userinfo == nil) {
        return;
    }
    
    CGRect rectBegin = [[userinfo objectForKey:@"UIKeyboardFrameBeginUserInfoKey"] CGRectValue];
    CGRect rectEnd = [[userinfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat distance = rectBegin.origin.y - rectEnd.origin.y;
    
	CGRect rect = txtView.frame;
	rect.size.height = rect.size.height - distance;
	txtView.frame = rect;
	keyboardVisible = false;
	
	rect = btnKeyboard.frame;
	//rect.origin.y = rect.origin.y - distance;//192  rect.origin.y
    rect.origin.y=self.view.frame.size.height-btnKeyboard.frame.size.height;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:btnKeyboard cache:YES];
	[UIView setAnimationDuration:[[userinfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue]];
	btnKeyboard.frame = rect;
	[UIView commitAnimations];
	
	
}

-(void) keyboardWillShow:(NSNotification*) notif
{
    NSDictionary *userinfo = notif.userInfo;
    
    if (userinfo == nil) {
        return;
    }
    
    
    CGRect rectBegin = [[userinfo objectForKey:@"UIKeyboardFrameBeginUserInfoKey"] CGRectValue];
    CGRect rectEnd = [[userinfo objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    CGFloat distance = rectBegin.origin.y - rectEnd.origin.y;
    
	CGRect rect = txtView.frame;//175
    BOOL isRatina=[self isRetina];
    if(isRatina)
    {
        NSLog(@"Iphone %f ",[[UIScreen mainScreen] bounds].size.height);
        if ([[UIScreen mainScreen] bounds].size.height == 568)
        {
            rect.size.height=self.view.frame.size.height/3.2;
        }
        else
        {
            rect.size.height=self.view.frame.size.height/5.2;
        }
    }
    else
    {
	rect.size.height=self.view.frame.size.height/5;
    }
	txtView.frame = rect;
	keyboardVisible = true;
	
	rect = btnKeyboard.frame;
	//rect.origin.y = rect.origin.y - distance;
    
    rect.origin.y=self.view.frame.size.height-rect.size.height*2 - distance;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:btnKeyboard cache:YES];
	[UIView setAnimationDuration:[[userinfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue]];
	btnKeyboard.frame = rect;
	[UIView commitAnimations];
}
- (BOOL) isRetina
{
    if([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        return [[UIScreen mainScreen] scale] == 2.0 ? YES : NO;
    
    return NO;
}

#pragma mark Textview delegates
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (toDelete) {
        return true;
    }
		// Any new character added is passed in as the "text" parameter
	[btnBack setTitle:LOC(@"Save") forState:UIControlStateNormal];
		// For any other character return TRUE so that the text gets added to the view
    self.processMessage = txtView.text;
    saveButtonOn = YES;
    return TRUE;
}

-(NSString*) getFormatedTime:(int)first second:(int) second
{
	return [NSString stringWithFormat:@"%02d:%02d", first, second];
}




//code added by ankur  on may 29 2013



- (IBAction)openBtnTouched:(id)sender{}

//- (IBAction)eventAddButtonPressed:(id)sender
- (void)eventAddButtonPressed

{
    EKEventStore* eventStore = [[EKEventStore alloc] init];
    
    // iOS 6 introduced a requirement where the app must
    // explicitly request access to the user's calendar. This
    // function is built to support the new iOS6 requirement,
    // as well as earlier versions of the OS.
    if([eventStore respondsToSelector:
        @selector(requestAccessToEntityType:completion:)]) {
        // iOS 6 and later
        [eventStore
         requestAccessToEntityType:EKEntityTypeEvent
         completion:^(BOOL granted, NSError *error) {
             [self performSelectorOnMainThread:
              @selector(presentEventEditViewControllerWithEventStore:)
                                    withObject:eventStore
                                 waitUntilDone:NO];
         }];
    } else {
        // iOS 5
        [self presentEventEditViewControllerWithEventStore:eventStore];
    }
}

- (void)presentEventEditViewControllerWithEventStore:(EKEventStore*)eventStore
{
    EKEventEditViewController* vc = [[EKEventEditViewController alloc] init];

    vc.eventStore = eventStore;
    
    events = [EKEvent eventWithEventStore:eventStore];
    // Prepopulate all kinds of useful information with you event.
    events.title = LOC(@"app.name");
    events.startDate = [NSDate date];
    events.endDate = [NSDate date];
    events.URL = [NSURL URLWithString:@"http://www.InstaVoiceTest.com"];
    events.notes = @"Event";
    events.allDay = YES;
    vc.event = events;
    
    vc.editViewDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
   // SettingsManager* settings = [SettingsManager sharedManager];
   // NSString * lang = settings.language;
   // Localizer* loc = [[Localizer alloc] init];
    

}

#pragma EKEventEditViewDelegate

- (void)eventEditViewController:(EKEventEditViewController*)controller
          didCompleteWithAction:(EKEventEditViewAction)action
{
    
    
    UIAlertView *alert=[[[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[NSString stringWithFormat:LOC(@"Calendar Event Added: %@ at %@") ,events.notes,events.endDate] delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil] autorelease];
    
 //   NSLog(@"events.notes,events.endDate %@  %@",events.notes,events.endDate);
    [alert show];
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    //    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
