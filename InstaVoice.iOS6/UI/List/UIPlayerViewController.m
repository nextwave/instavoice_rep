//
//  UIPlayerViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIPlayerViewController.h"
//#import "UIiJotSelectedListCell.h"
#import "UIiJotListViewController.h"

bool paused;
bool stopped;

@implementation UIPlayerViewController
@synthesize lblTime;
@synthesize slider;
@synthesize managedObject;
@synthesize delegate;

//Edited By Vinneth
@synthesize pauseButton;
@synthesize startButton;
@synthesize stopButton;

int pauseCount=2;


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
	[slider setThumbImage: [UIImage imageNamed:@"slider_thumb.png"] forState:UIControlStateNormal];
	[slider setMinimumTrackImage:[UIImage imageNamed:@"slider_bar.png"] forState:UIControlStateNormal];
	[slider setMaximumTrackImage:[UIImage imageNamed:@"slider_bar.png"] forState:UIControlStateNormal];
    
    [self resetButtons];
	
    //Added by Vineeth
   /* if (paused == false)
    {
        UIImage* pauseButtonImage = [UIImage imageNamed:@"toBePaused.png"];
        [pauseButton setImage:pauseButtonImage forState:UIControlStateNormal];
        
        
        UIImage* startButtonImageOne = [UIImage imageNamed:@"startedAudio.png"];
        [startButton setImage:startButtonImageOne forState:UIControlStateNormal];
        
        UIiJotListViewController *c1 = [[UIiJotListViewController alloc] init]; 
        
        [c1 reloadData];
        
               
    }
*/
}


-(void) resetButtons
{
    [pauseButton setImage:[UIImage imageNamed:@"edit_pause.png"] forState:UIControlStateNormal];
    [stopButton setImage:[UIImage imageNamed:@"edit_stop.png"] forState:UIControlStateNormal];
    [pauseButton setImage:[UIImage imageNamed:@"edit_pause_tapped.png"] forState:UIControlStateHighlighted];
    [stopButton setImage:[UIImage imageNamed:@"edit_stop_tapped.png"] forState:UIControlStateHighlighted];

}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}
-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[lblTime release];
	[slider release];
    [super dealloc];
}

#pragma mark Functions

-(NSString*) getFormatedTime:(int) first second:(int) second
{
	NSString* result = @"";
	if (first<10)
	{
		result = [NSString stringWithFormat:@"0%d", first];
	}
	else
	{
		result = [NSString stringWithFormat:@"%d", first];
	}
	NSString* result2 = @"";
	if (second<10)
	{
		result2 = [NSString stringWithFormat:@"0%d", second];
	}
	else
	{
		result2 = [NSString stringWithFormat:@"%d", second];
	}
	return [NSString stringWithFormat:@"0:%@:%@", result, result2];
}

-(void) updateTime
{
	if (paused)
		return;
	
	timerTicks++;

    
    //by EKBPGK Ticket #2
    
    startButton.selected = NO;
    
    /*
     if (timerTicks%2 == 1) {
     startButton.selected = YES;
     }
     else
     {
     startButton.selected = NO;
     }
     */
    
    //
    
	if (totalTime <= timerTicks)
	{
		if (playerTime != nil)
		{
			[playerTime invalidate];
			playerTime = nil;
		}
		slider.value = 0;
		lblTime.text = @"0:00:00";
        [delegate performSelector:@selector(audioComplete)];

    //by EKBPGK Ticket #2
        
            //startButton.selected = NO;
            startButton.selected = YES;
        
            //
		
        return;
	}
	
	lblTime.text = [NSString stringWithFormat:@"%@", [self getFormatedTime:timerTicks/60 second:timerTicks%60]];
	slider.value = timerTicks;
}


- (IBAction)sliderValueChange:(id)sender
{
    float value=slider.value;
  //  timerTicks=value*totalTime;
    
    timerTicks=value;
    NSLog(@"timerTicks new %d",timerTicks);
    
    lblTime.text = [NSString stringWithFormat:@"%@", [self getFormatedTime:timerTicks/60 second:timerTicks%60]];
    
	slider.value = timerTicks;
    
    player.currentTime=timerTicks;
}

-(void) startPlay
{
    NSLog(@"startPlay");
    
    
    [self resetButtons];
    
    
   // startButton.selected = NO;
       
    
	UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;     
	
	AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,          
							 sizeof (audioRouteOverride),&audioRouteOverride); 
	
	paused = false;
    
        
	if (player != nil && [player isPlaying])
	{
			//DLog(@"onClickPlay stopping");
        
        
		[player stop];
		[player release];
		player = nil;
		
		if (playerTime != nil)
		{
			[playerTime invalidate];
			playerTime = nil;
		}
		slider.value = 0;
		lblTime.text = @"0:00:00";
	}

	
	{
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
            
            
           /* startButton.imageView.animationImages =
            [NSArray arrayWithObjects:[UIImage imageNamed:@"pausedAudio.png"],
             [UIImage imageNamed:@"pausedAudio1.png"],
             nil];
            startButton.imageView.animationDuration = 0.5; //whatever you want (in seconds)
            [startButton.imageView startAnimating];

            */
            
            
			[player play];    
			if (playerTime != nil)
			{
				[playerTime invalidate];
				playerTime = nil;
			}
			slider.value = 0;
			NSString* calculatedTime = [managedObject.duration stringByReplacingOccurrencesOfString:@" s" withString:@""];
			totalTime = [calculatedTime intValue];
			slider.minimumValue = 0.0;
			slider.maximumValue = totalTime;
			
			timerTicks = 0;
             startButton.selected = NO;
			playerTime = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
            
                        
           startButton.selected = NO;
			
		}
		else 
		{
			DLog(@"onClickPlay file not exist");
		}
	}
    //Edited by Vineeth
  /*  
    startButton.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"toBePlayed.png"],
     [UIImage imageNamed:@"NoImage.png"],
     nil];
    startButton.imageView.animationDuration = 0.5; //whatever you want (in seconds)
    [startButton.imageView startAnimating];
    
    NSLog(@"Image will change");
    
   */ 
    //Edited By Vineeth end
    

       
    
}

-(void) stopPlay
{
	if (player != nil && [player isPlaying])
	{
			//DLog(@"onClickPlay stopping");
		[player stop];
		[player release];
		player = nil;
		
		if (playerTime != nil)
		{
			[playerTime invalidate];
			playerTime = nil;
		}
	}

	paused = false;
	slider.value = 0;
	lblTime.text = @"0:00:00";
}

-(IBAction) onClickStop
{
	UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.tag = self.view.tag;
    
    //Edited by Vineeth
    /*startButton.imageView.animationImages =
    [NSArray arrayWithObjects:[UIImage imageNamed:@"toBePlayed.png"],
     [UIImage imageNamed:@"NoImage.png"],
     nil];
    
    startButton.imageView.animationDuration = 0.5; //whatever you want (in seconds)
    [startButton.imageView startAnimating];
    
    NSLog(@"Image will change");
   */ 
    
    //Edited By Vineeth end

    startButton.selected = NO;
    [stopButton setImage:[UIImage imageNamed:@"edit_stop_tapped.png"] forState:UIControlStateNormal];
    
    [delegate performSelector:@selector(onClickStop:) withObject:button];
}

-(IBAction) onClickPause
{
    
    
    startButton.selected = NO;
    
    if(pauseCount!=1)
    {
        pauseCount=1;
    }
    else{
        
        pauseCount=2;
    }
    
    
    //pauseButton.hidden=YES;
    //pauseButton.enabled=NO;
    
    //[pauseButton setEnabled:NO];
    
   /* if (paused != true)
    {
    UIImage* pauseButtonImage = [UIImage imageNamed:@"pausedAudio.png"];
    [pauseButton setImage:pauseButtonImage forState:UIControlStateNormal];
        
        
    UIImage* startButtonImageOne = [UIImage imageNamed:@"toBePlayed.png"];
    [startButton setImage:startButtonImageOne forState:UIControlStateNormal];
        
      UIiJotListViewController *c1 = [[UIiJotListViewController alloc] init]; 
        
        [c1 reloadData];
   */     
     //   NSLog(@"Going to execute reloaddata");   
        
     //   [c1.customTable reloadData];
        
   // UIiJotSelectedListCell *c1 = [[UIiJotSelectedListCell alloc] init];
    //    c1.btnStop.hidden=YES;

     //[c1.btnStop setImage:startButtonImageOne forState:UIControlStateNormal];    
      
        
    //self.view.userInteractionEnabled = FALSE;
        
    /*    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"UIiJotSelectedListCell" owner:self options:nil];
        
        UIiJotSelectedListCell *selectedCell = (UIiJotSelectedListCell *)[array objectAtIndex:0];
        selectedCell.btnStop.hidden=YES;
    */    
        //[selectedCell.btnStop setImage:startButtonImageOne forState:UIControlStateNormal];
        
  //  }
    
       
    NSLog(@"Pause button Clicked");
    if (player != nil && [player isPlaying])
	{
		paused = true;
		[player pause];
        startButton.selected=YES;
        pauseCount=1;
        
        //by EKBPGK Ticket #2
        //editPlayBtn.selected = NO;
		
     //   editPlayBtn.selected = YES;
		
        //
        
        
        //lblElapsedTime2.hidden = NO;
	}
    
    else
    {
        if(pauseCount==1)
        {
            paused = true;
            
            //by EKBPGK Ticket #2
            startButton.selected=YES;
            //
            
            [player pause];
            
        }
        else if(pauseCount==2){
            paused=false;
            [player play];
        }
    }
    
    if(paused) {
        [pauseButton setImage:[UIImage imageNamed:@"edit_pause_tapped.png"] forState:UIControlStateNormal];
    } else {
        [pauseButton setImage:[UIImage imageNamed:@"edit_pause.png"] forState:UIControlStateNormal];
    }
     
}



-(IBAction) onClickPlay
{
    //by EKBPGK Ticket #2
    [self resetButtons];
    //
    
	if (paused)
	{
		/*
            UIImage* pauseButtonImageOne = [UIImage imageNamed:@"toBePaused.png"];
            [pauseButton setImage:pauseButtonImageOne forState:UIControlStateNormal];
        
        
            UIImage* startButtonImageOne = [UIImage imageNamed:@"startedAudio.png"];
            [startButton setImage:startButtonImageOne forState:UIControlStateNormal];
            //self.view.userInteractionEnabled = FALSE;
        
        
        UIiJotListViewController *c1 = [[UIiJotListViewController alloc] init]; 
        
        [c1 reloadData];
      */  
                
      //by EKBPGK Ticket #2      
        pauseCount=0;
        //
        
        [player play];
		paused = false;
	}
    else if([player isPlaying])
    {
        [self onClickPause];
    }
}
@end
