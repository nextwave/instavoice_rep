//
//  UISettingsViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UISettingsDetailViewController.h"
#import "UILogsViewController.h"
#import "UICheckBoxCell.h"
#import "UICustomDetailCell.h"
#import "UIParentViewController.h"

@interface UISettingsViewController : UIParentViewController {
	UITableView* customTable;
	UICustomDetailCell* tmpDetailCell;
	UICheckBoxCell* tmpCheckBoxCell;
	UISettingsDetailViewController* detailController;
	UILogsViewController* logController;
}
@property (nonatomic, assign) IBOutlet UICheckBoxCell* tmpCheckBoxCell;
@property (nonatomic, assign) IBOutlet UICustomDetailCell* tmpDetailCell;
@property (nonatomic, retain) IBOutlet UITableView* customTable;

@property (retain, nonatomic) IBOutlet UILabel *settingsLabel;
-(void) onClickDone;
//-(void) onClickReset;

-(UIBottomMenuBarViewController *)returnBottom;

-(void) customRefresh;
@end
