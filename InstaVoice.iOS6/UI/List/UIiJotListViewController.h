//
//  UIiJotListViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "UIiJotDetailViewController.h"
#import "UIParentViewController.h"
#import "UIPlayerViewController.h"
//#import "UIListCell.h"
@class UIListCell;

@interface UIiJotListViewController : UIParentViewController <NSFetchedResultsControllerDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchDisplayDelegate>
{
	UITableView* customTable;
    UIiJotDetailViewController* detailController;
	bool searchEnabled;
	UIButton* btnEdit;
	
	UIPlayerViewController* playerController;
	NSMutableDictionary* editDictionary;
	UIButton* btnDelete;
    
    int rowNum;
    
    //by EKBPGK Ticket #62
    BOOL isVisibleDetalListPlayer;
            //
    NSString * lang;
    Localizer * loc;
    UIListCell *listCell;
    NSMutableArray *editListArray;
}

@property (nonatomic, retain) IBOutlet UIButton* btnDelete;
@property (nonatomic, retain) NSMutableDictionary* editDictionary;
@property (nonatomic, retain) IBOutlet UIButton* btnEdit;
@property (nonatomic, retain) IBOutlet UITableView* customTable;
@property (readwrite, assign) int currentSelected;
@property (retain, nonatomic) IBOutlet UIButton *EditBtn;
@property (retain, nonatomic) IBOutlet UILabel *listTital;

-(void)onClickDone;
-(IBAction) onClickEdit;
-(IBAction) onClickDelete;

-(void) onclickFlag:(UIButton*) btn;
-(void) onClickStop:(UIButton*) btn;
-(void) onClickSelectInEdit:(UIButton*) btn;
-(void) onClickPlay:(id) cell;
-(void) onClickPause:(UIButton*) btn;
-(void) searchText:(NSString*) str;
-(void) expandCell:(NSArray*) arr;

-(void) audioComplete;
- (void)updateFlagList;  //.........By kamal..

-(void) reloadData;


@end
