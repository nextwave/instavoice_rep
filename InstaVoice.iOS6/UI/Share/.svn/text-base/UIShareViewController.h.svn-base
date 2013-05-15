//
//  UIShareViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIShareCell.h"
#import "DBManager.h"
#import "DBJottTable.h"

@interface UIShareViewController : UIViewController {
	UITableView* customTable;
	UIShareCell* tmpShareCell;
	UIView* dimView;
	
    DBJottTable *managedObject;
    
    NSString *msg;
    
	id delegate;
}
@property (nonatomic, retain) IBOutlet UIView* dimView;

@property (nonatomic, retain) IBOutlet UITableView* customTable;
@property (nonatomic, assign) IBOutlet UIShareCell* tmpShareCell;
@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) DBJottTable *managedObject;
@property (nonatomic, retain) NSString *msg;
@property (retain, nonatomic) IBOutlet UIButton *cancelBtn;

-(IBAction) onClickCancel;
-(void)reloadCustomTable;
@end
