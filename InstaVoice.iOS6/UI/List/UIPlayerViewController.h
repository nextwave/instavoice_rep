//
//  UIPlayerViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 8/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "DBJottTable.h"
//#import "UIiJotSelectedListCell.h"

@interface UIPlayerViewController : UIViewController {
	UILabel* lblTime;
	UISlider* slider;
	DBJottTable *managedObject;
	AVAudioPlayer  *player;
	NSTimer* playerTime;
	
	int timerTicks;
	int totalTime;
	id delegate;
	//bool paused;

    
    //Edited by Vineeth
    IBOutlet UIButton* pauseButton;
    IBOutlet UIButton* startButton;
    IBOutlet UIButton* stopButton;
    
    
}
@property (nonatomic, retain) DBJottTable *managedObject;
@property (nonatomic, retain) IBOutlet 	UILabel* lblTime;
@property (nonatomic, retain) IBOutlet 	 UISlider* slider;
@property (nonatomic, assign) id delegate;


//Edited by Vineeth
@property (nonatomic, retain)IBOutlet UIButton* pauseButton;
@property (nonatomic, retain)IBOutlet UIButton* startButton;
@property (nonatomic, retain)IBOutlet UIButton* stopButton;

- (IBAction)sliderValueChange:(id)sender;

-(void) startPlay;
-(void) stopPlay;

-(IBAction) onClickStop;
-(IBAction) onClickPause;
-(IBAction) onClickPlay;

-(void) resetButtons;

-(NSString*) getFormatedTime:(int) first second:(int) second;



@end
