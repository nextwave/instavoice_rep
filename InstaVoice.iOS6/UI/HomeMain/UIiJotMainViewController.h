//
//  UIiJotMainViewController.h
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NaunceManager.h"
#import "DBJottTable.h"
#import "UIiJotDetailViewController.h"
#import "UIParentViewController.h"
#import "UIHelpMainViewController.h"
#import "SineWaveView.h"
#import "UICustomProgressBarViewController.h"
#import "UIHelpDetailViewController.h"

@interface UIiJotMainViewController : UIParentViewController <SKRecognizerDelegate, UIActionSheetDelegate, AVAudioRecorderDelegate>  {
    
    IBOutlet UITextView *txtTranslated;
	UIiJotDetailViewController* detailController;

	UIHelpMainViewController* helpController;
    UIHelpDetailViewController* helpDetailController;
	UIButton* btnTouchToCommand;
	
	SineWaveView* shapeView;
	NSTimer* graphTimer;
	
	UICustomProgressBarViewController* customProgress;
	bool startOnAutoOn;
	bool backtoOtherView;
    bool isEnd;
    
    DBJottTable *managerObject;
    IBOutlet UIImageView *beginHereImgView;
}

@property (nonatomic) bool backtoOtherView;

@property (retain, nonatomic) IBOutlet UIImageView *backAudioImage;
@property (nonatomic, retain) IBOutlet SineWaveView* shapeView;
@property (nonatomic, retain) IBOutlet UIButton* btnTouchToCommand;
@property (retain, nonatomic) IBOutlet UIView *beginHereView;
@property (retain, nonatomic) IBOutlet UIImageView *beginHereImgView;
@property (retain, nonatomic) IBOutlet UIImageView *holeFillerImage;




- (void)onClickDone;

- (IBAction)onClickStartStopDone:(id)sender;

- (IBAction)onClickStartStop:(id)sender;
- (void)updateVUMeter;

-(void) saveJot:(NSString*) result;
-(void) showJot:(NSString*) result;

-(void) hideHelpTag:(BOOL)animation;
-(void) showHelpDetialView;


-(void) customTouchButtonEnable:(bool) val;
-(void) customEnable:(bool)val;

@end
