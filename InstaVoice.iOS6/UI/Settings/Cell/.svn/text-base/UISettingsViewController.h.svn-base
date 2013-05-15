//
//  UINewSettingsViewController.h
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

@interface UINewSettingsViewController : UIParentViewController {
	UITableView* customTable;
	UICustomDetailCell* tmpDetailCell;
	UICheckBoxCell* tmpCheckBoxCell;
	UISettingsDetailViewController* detailController;
	UILogsViewController* logController;
}
@property (nonatomic, assign) IBOutlet UICheckBoxCell* tmpCheckBoxCell;
@property (nonatomic, assign) IBOutlet UICustomDetailCell* tmpDetailCell;
@property (nonatomic, retain) IBOutlet UITableView* customTable;

-(IBAction) onClickDone;
-(IBAction) onClickReset;

-(IBAction) onClickTemp;

-(void) customRefresh;
@end
