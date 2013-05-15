//
//  UISettingsDetailViewController.h
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UICustomImageCell.h"


@class UISettingsViewController;

typedef enum 
{
	eLanguage,
	eDictation,
	eSearchType,
	eLoginType
}Type;

@interface UISettingsDetailViewController : UIViewController {
    
    NSMutableArray* languageArray;
	NSMutableArray* languageNameArray;
	NSMutableArray* dictationArray;
	NSMutableArray* searchArray;
    NSMutableArray* loginArray;
	id delegate;
	Type type;
	
	UITableView* customTable;
	
	UICustomImageCell* tmpImageCell;
	UILabel* lblCustomTitle;
	
	UIView* grayView;
    
	NSArray* _permissions;
    
    id parent;
    
}

@property (nonatomic,retain) UISettingsViewController *realDelegate;

@property (nonatomic, assign) id parent;
@property (nonatomic, retain) IBOutlet UIView* grayView;
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UILabel* lblCustomTitle;

@property (retain, nonatomic) IBOutlet UIButton *cancelBtn;
@property (nonatomic, assign) IBOutlet UICustomImageCell* tmpImageCell;
@property (nonatomic, retain) IBOutlet UITableView* customTable;
@property (nonatomic) Type type;

-(void) customRefresh;
-(IBAction) onClickBack;

-(void)loginWordpress;
@end
