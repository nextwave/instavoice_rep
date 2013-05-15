//
//  UILogsViewController.h
//  iJot
//
//  Created by pda.developer@gmail.com on 5/17/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface UILogsViewController : UIViewController <MFMailComposeViewControllerDelegate>{
	UITextView* txtView;
	UIScrollView* scroll;
	UISwitch* logSwitch;
}
@property (nonatomic, retain) IBOutlet UISwitch* logSwitch;
@property (nonatomic, retain) IBOutlet UIScrollView* scroll;
@property (nonatomic, retain) IBOutlet UITextView* txtView;
-(IBAction) onClickRefresh;
-(IBAction) onClickDone;

-(IBAction) onClickCopyToClipboard;

-(IBAction) onClickClear;
-(IBAction) onClickException;

+ (void)redirectNSLogToDocumentFolder;
-(IBAction) onClickSendEmail;

-(NSString*) logFileName;

+ (void)badAccess;

@property (retain, nonatomic) IBOutlet UIBarButtonItem *DoneBut;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *LoadLogsButt;
@property (retain, nonatomic) IBOutlet UINavigationItem *NavigationItem;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *EmailButt;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *CopyButt;
@property (retain, nonatomic) IBOutlet UIBarButtonItem *ClearLogButt;
@property (retain, nonatomic) IBOutlet UILabel *EnableLogsLabel;
-(IBAction) onClickEnableChange;
+(void)saveCrashLogInFile:(NSException *)exception;
@end
