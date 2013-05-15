//
//  UISettingsAddAccountViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 5/23/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITextFieldCell.h"


@interface UISettingsAddAccountViewController : UIViewController<UIAlertViewDelegate> {
	UITableView* customTable;
	UITextFieldCell* tmpTextCell;
	UILabel* lblTitle;
	NSString* customTitle;
	
	NSString* strTitle;
	NSString* strContent;
	id delegate;
	
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, copy) NSString* strTitle;
@property (nonatomic, copy) NSString* strContent;

@property (nonatomic, copy) NSString* customTitle;
@property (nonatomic, retain) IBOutlet UILabel* lblTitle;
@property (retain, nonatomic) IBOutlet UIButton *cancelBtn;


@property (nonatomic, assign) IBOutlet UITextFieldCell* tmpTextCell;
@property (nonatomic, retain) IBOutlet UITableView* customTable;
-(IBAction) onClickLogin;
-(IBAction) onClickCancel;
@end
