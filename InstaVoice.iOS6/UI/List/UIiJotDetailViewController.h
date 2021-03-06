//
//  UIiJotDetailViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 4/3/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBookUI/ABPersonViewController.h>
#import "DBJottTable.h"
#import <MessageUI/MessageUI.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#import "UISearchViewController.h"
#import "UIMapsViewController.h"
#import "UIShareViewController.h"

#import <CoreLocation/CoreLocation.h>//Edited Alignminds kamal
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import <EventKit/EKEventStore.h>



@interface MyMailComposeViewController : MFMailComposeViewController {
}
@end


@interface UIiJotDetailViewController : UIViewController <MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate,CLLocationManagerDelegate,UIAlertViewDelegate,EKEventEditViewDelegate> {
 
	DBJottTable *managedObject;
	bool directAccess;
	
	NSArray* _permissions;
	
	AVAudioPlayer  *player;

	UILabel* lblElapsedTime;
	NSTimer* playerTime;
	int timerTicks;
	int totalTime;
	
	UITextView* txtView;
	
	bool matchPattern;
	UISlider* sliderControl;
	
    
    
	UIMapsViewController* mapController;
	UISearchViewController* searchController;
    
	bool keyboardVisible;
	UIButton* btnKeyboard;
    
	UIButton* btnBack;
    
  
	
	UIShareViewController* shareController;
	
	bool saveButtonOn;
	
	UIView* editPlayerView;
	bool paused;
	//NSString* messageToSend;
    bool toDelete;
    
    bool isBackOtherView;
    
    NSString *processMessage;

    NSString *mapPendingMessage;
    
    CLLocationManager *locationManager;   //Edited Alignminds
    EKEvent* events;

}



@property (nonatomic, copy) NSString* processMessage;
@property (nonatomic, retain) NSString* mapPendingMessage;
@property (nonatomic, retain) IBOutlet UIView* editPlayerView;
@property (nonatomic) bool saveButtonOn;
@property (nonatomic, retain) IBOutlet UIButton* btnBack;

@property (nonatomic, retain) IBOutlet UIButton* btnKeyboard;
@property (nonatomic, retain) IBOutlet UISlider* sliderControl;

@property (nonatomic) bool matchPattern;

@property (nonatomic, retain) IBOutlet  UITextView* txtView;
 @property (nonatomic,retain) IBOutlet UIButton *shareBtn;
@property (nonatomic, retain) IBOutlet UILabel* lblElapsedTime;
@property (retain, nonatomic) IBOutlet UILabel *lblElapsedTime2;
@property (nonatomic) bool directAccess;
@property (nonatomic, assign) DBJottTable *managedObject;

@property (retain, nonatomic) IBOutlet UIButton *editPlayBtn;
@property (retain, nonatomic) IBOutlet UIButton *editShowBtn;
@property (retain, nonatomic) IBOutlet UIButton *editPauseBtn;
@property (retain, nonatomic) IBOutlet UIButton *editStopBtn;
@property (retain, nonatomic) IBOutlet UIImageView *imgBackground;
- (IBAction)sliderValuechange:(id)sender;

-(IBAction) onClickEditPlayer;
-(IBAction) onClickShare;
-(IBAction) onClickBack;

- (void)updateThis;
- (void)deleteThis;
-(void) prePatternMatch;
-(void) patternMatch;
-(IBAction) onClickShowHideKeyboard;

-(void) onWordPress:(NSString*) message;
-(void) sendFacebook:(NSString*) message;;
-(void) sendTweet:(NSString*) message;;
-(void) sendSMS:(NSString*) message;;
-(void) calenderThis:(NSString*) message;
-(void) remindMe:(NSString*) message;
-(void) sendEmail:(NSString*) message;;

-(IBAction) onClickPlay;
-(IBAction) onClickStop;

-(NSString*) getFormatedTime:(int) first second:(int) second;

-(IBAction) onClickPause;

-(void) keyboardWillHide:(NSNotification*) notif;
-(void) keyboardWillShow:(NSNotification*) notif;


- (IBAction)openBtnTouched:(id)sender;

@end
