//
//  UIiJotListViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UIiJotListViewController.h"
#import "DBManager.h"
#import "DBJottTable.h"
#import "UIPlayerViewController.h"
#import "UIiJotDetailViewController.h"
#import "PostProcessing.h"
#import "UIListCell.h"

//#import "UIiJotMainViewController.h"

bool paused;
//bool fromListView;

@implementation UIiJotListViewController
@synthesize customTable;
@synthesize btnEdit;
@synthesize editDictionary;
@synthesize btnDelete;
@synthesize currentSelected;

NSManagedObjectContext *context;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
			// Custom initialization
    }
    return self;
}
 
- (void)dealloc
{
	[btnDelete release];
	[editDictionary release];
	[playerController release];
	[btnEdit release];
    [detailController release];
	[customTable release];
    [_EditBtn release];
    [_listTital release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
		// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
		// Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //fromListView=true;
    
    
    //by EKBPGK Ticket #62
    isVisibleDetalListPlayer=NO;
    //
    
    /*UIiJotMainViewController *c1 = [[UIiJotMainViewController alloc] init];
    
    
    c1.backtoOtherView = true;
    
    */
	
	currentSelected = -1;
	
	// Do any additional setup after loading the view from its nib.
	DLog(@"View did load");
	DBManager* manager = [DBManager sharedManager];
	manager.fetchedResultsController.delegate = self;
	manager.searchFetchedResultsController.delegate = self;
	
	if (playerController == nil)
		playerController = [[UIPlayerViewController alloc] initWithNibName:@"UIPlayerViewController" bundle:[NSBundle mainBundle]];
	//playerController.view.hidden = true;
	//[self.view addSubview:playerController.view];
	
	//self.searchDisplayController.searchResultsTableView.rowHeight = 50;
	//[self.searchDisplayController.searchResultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [bottomBar.btnList setSelected:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
    
    
    paused=false;
	if (searchEnabled)
		[self.searchDisplayController.searchResultsTableView reloadData];
	else 
		[customTable reloadData];
    SettingsManager* settings = [SettingsManager sharedManager];
    lang = settings.language;
    loc =[[Localizer alloc]init];
  //  self.EditBtn.titleLabel.text = [loc Edit:lang];
    [self.EditBtn setTitle:[loc Edit:lang] forState:UIControlStateNormal];
    self.listTital.text=[loc ListView:lang];
}

- (void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    if (customTable.editing) {
        [self onClickEdit];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
		// Release any retained subviews of the main view.
		// e.g. self.myOutlet = nil;
}

/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
		// Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
#pragma mark Functions
//.........By kamal..31 .5. 2012............///////
- (void)updateFlagList 
{
    DBManager* manager = [DBManager sharedManager];
    NSLog(@"Entered in to updateThis%@",manager);
    context=[manager managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"DBJottTable" inManagedObjectContext:[manager managedObjectContext]];
    [request setEntity:entity]; 
    NSError *error;
    NSMutableArray *mutableFetchResults = [[[[manager managedObjectContext] executeFetchRequest:request error:&error] mutableCopy] autorelease];
    NSLog(@"mutableFetchResults :%@",mutableFetchResults);
    [request release];
    
    for (int i=0; i<[mutableFetchResults count]; i++) {
        [context lock];
         DBJottTable *entity = nil;
        entity=[mutableFetchResults objectAtIndex:i];
        NSLog(@"Flag of date :%@ ,flg :%@",entity.message,entity.flag);
        
        //  NSString *str_Padding = [[NSString string] stringByPaddingToLength: 10 withString: @"[Flagged]" startingAtIndex: 0];
        NSString* str_Message;
        
        if ([entity.flag intValue]==1) {
             
            str_Message=[NSString stringWithFormat:@"%@\n\n\n\n\n%@",entity.message,@"[Flagged]"];
            //  entity.message=str_Message;
            
            }
        else 
        {
                str_Message=entity.message;
                //     NSLog(@"flg remove is:%@",str_Message);
                }
        NSLog(@"flg remove is:%@",str_Message);
        NSString* sourceFile = [NSString stringWithFormat:@"%@/%@.txt", RECORDINGS_FOLDER, entity.name];
        //sourceFile = [sourceFile stringByReplacingOccurrencesOfString:@".m4a" withString:@".txt"];
        NSError* error = nil;
        NSFileManager* file = [NSFileManager defaultManager];
        
        if (![file removeItemAtPath:sourceFile error:&error])
            {
                DLog(@"Error in copying = %@", [error description]);
                }
        
        NSLog(@"Third string 3txtViewStringWhenFlagged is:%@",str_Message);
        
        [str_Message writeToFile:sourceFile atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        
        /*    //Save it
                   error = nil;
                   if (![context save:&error]) {
                       //Handle any error with the saving of the context
                       NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
                   }
                   */
        
        [context unlock];
        
       }
}
-(void)onClickDone
{
   
        
    [detailController dismissViewControllerAnimated:NO completion:^{
        // Nothing to do
    }];
    [self dismissViewControllerAnimated:YES completion:^{
        // Nothing to do
    }];
}

static NSInteger nowPressedRow;

-(void) onClickStop:(UIButton*) btn
{
	DLog(@"index = %d", btn.tag);
		//[customTable reloadData];
	[playerController stopPlay];
   // [self togglePlayer:true];

    //by EKBPGK Ticket #62
    isVisibleDetalListPlayer=NO;
    currentSelected = -1;
    NSMutableArray* arr = [[[NSMutableArray alloc] init] autorelease];
    
    [arr addObject:[NSIndexPath indexPathForItem:nowPressedRow inSection:0]];
    
    [self expandCell:arr];
    //

    /*
	CGRect rect = playerController.view.frame;
	rect.origin.y = 80;
	playerController.view.frame = rect;
	rect.origin.y = 60;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:playerController.view cache:YES];
	[UIView setAnimationDuration:0.4];
	playerController.view.frame = rect;
	[UIView commitAnimations];
    */
    /*
	if (searchEnabled)
		[self.searchDisplayController.searchResultsTableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.4];
	else 
		[customTable performSelector:@selector(reloadData) withObject:nil afterDelay:0.4];
     */
}


/*
-(void) onclickFlag:(UIButton*) btn
{
    DLog(@"index = %d", btn.tag);
	DBManager* manager = [DBManager sharedManager];
    DBJottTable *managedObject = nil;
    
    if (searchEnabled) {
        managedObject = [manager.searchFetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]]; 
    }
    else
    {
        managedObject = [manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
    }

	int val = [managedObject.flag intValue];
	managedObject.flag = [NSNumber numberWithInt:!val];
	[manager saveContext];
	
	currentSelected= -1;
	if (searchEnabled)
		[self.searchDisplayController.searchResultsTableView reloadData];
	else 
		[customTable reloadData];
	[playerController stopPlay];
    
}*/    
    //************
    
    
-(void) onclickFlag:(UIButton*) btn
    {
        DLog(@"index = %d", btn.tag);
        DBManager* manager = [DBManager sharedManager];
        DBJottTable *managedObject = nil;
        
        if (searchEnabled) {
            managedObject = [manager.searchFetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
        }
        else
        {
            //Edited By Vineeth
            if (rowNum>0) {
               //  if (btn.tag) {
            
                NSLog(@"Entered in to Flagged image");
                managedObject = [manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
                 
            }
            
        }
        
        int val = [managedObject.flag intValue];
        managedObject.flag = [NSNumber numberWithInt:!val];
    /*    
        UIiJotDetailViewController *c=[[UIiJotDetailViewController alloc] init];
        [c updateThis];
        [c release];

      */  
               
        [manager saveContext];
        
        currentSelected= -1;
        if (searchEnabled)
            [self.searchDisplayController.searchResultsTableView reloadData];
        else 
            [customTable reloadData];
        [playerController stopPlay];
        [self togglePlayer:true];
}
    
    //************


-(void) togglePlayer:(bool) forceHide
{
    bool hide = forceHide;
    float alpha = 1.0;
    CGRect rect = playerController.view.frame;
    
    int y = rect.origin.y;
    
    bool isHidden = (y < 50);
    
    if(forceHide || !isHidden)
    {
        hide = true;
        alpha = 0.0;
        rect.origin.y = 80;
        playerController.view.frame = rect;
        //[playerController.view setAlpha:1.0];
        rect.origin.y = 20;
    }
    else
    {
        rect.origin.y = 20;
        playerController.view.frame = rect;
        //[playerController.view setAlpha:0.0];
        rect.origin.y = 80;
    }
    [UIView animateWithDuration:0.7 animations:^{
        playerController.view.frame = rect;
        //[playerController.view setAlpha:alpha];
    } completion:^(BOOL finished){
        //playerController.view.hidden = hide;
        if(hide) {
            currentSelected = -1;
            if (searchEnabled)
                [self.searchDisplayController.searchResultsTableView reloadData];
            else 
                [customTable reloadData];
            [playerController resetButtons];
        }
    }];
}


-(void) onClickPlay:(id)cell
{    
    
    UIListCell* tmp = (UIListCell*)cell;
    NSMutableArray* arr = [[[NSMutableArray alloc] init] autorelease];
    nowPressedRow=tmp.idx;
    [arr addObject:[NSIndexPath indexPathForItem:tmp.idx inSection:0]];
    if(tmp.idx==currentSelected) {
            //by EKBPGK Ticket #62
        isVisibleDetalListPlayer=NO;
        //
        self.currentSelected = -1;
    } else {
        if(currentSelected>-1) {
            [arr addObject:[NSIndexPath indexPathForItem:currentSelected inSection:0]];
        
        }
            //by EKBPGK Ticket #62
        isVisibleDetalListPlayer=YES;
        //
        self.currentSelected = tmp.idx;
    }
    [self expandCell:arr];
}


-(void) reloadData
{
    
    NSLog(@"reloading datas");
    
    NSLog(@"The value of the pause is %@\n", pause ? @"YES" : @"NO");
   
    [ self onclickFlag:nil];
    [self.customTable reloadData];
    
}

-(void) onClickPause:(UIButton*) btn
{
    
     NSLog(@"onClickPause");
    
    [playerController onClickPause];
    NSLog(@"onClickPause");
    
    
}

-(void) onClickSelectInEdit:(UIButton*) btn
{
    DLog(@"index = %d", btn.tag);
	if (self.editDictionary == nil)
		self.editDictionary = [NSMutableDictionary dictionary];
	DBManager* manager = [DBManager sharedManager];
	DBJottTable *managedObject = nil;
	if (searchEnabled)
	{
		//managedObject = [manager.searchFetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
        managedObject=[editListArray objectAtIndex:btn.tag];
	}
	else 
	{
		//managedObject = [manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
        
        managedObject=[editListArray objectAtIndex:btn.tag];
	}
	
	NSString* value = [self.editDictionary objectForKey:managedObject.name];
	
	if (value == nil || [value length] == 0)
	{
		[self.editDictionary setValue:managedObject.name forKey:managedObject.name];
	}
	else 
	{
		//[self.editDictionary setValue:@"" forKey:managedObject.name];
        [self.editDictionary removeObjectForKey:managedObject.name];
	}
	[self.searchDisplayController.searchResultsTableView reloadData];
	[customTable reloadData];
}


-(IBAction) onClickEdit
{
	if (customTable.editing)
    {
	//	[btnEdit setTitle:@"Edit" forState:UIControlStateNormal];//[loc Edit:lang]
        [btnEdit setTitle:[loc Edit:lang] forState:UIControlStateNormal];
		[editDictionary removeAllObjects];
		btnDelete.hidden = true;
        [customTable setEditing:NO animated:YES];
        listCell.isEditing=YES;
    
    }
    else
    {
	//	[btnEdit setTitle:@"Done" forState:UIControlStateNormal];//Done
        [btnEdit setTitle:[loc Done:lang] forState:UIControlStateNormal];
		currentSelected = -1;
		[playerController stopPlay];
		[editDictionary removeAllObjects];
		btnDelete.hidden = false;
        [btnDelete setTitle:[loc Delete:lang] forState:UIControlStateNormal];
        listCell.isEditing=NO;
        [customTable setEditing:YES animated:YES];
    }
    
    if (searchEnabled) {
        [self.searchDisplayController.searchResultsTableView reloadData];
    }
    else
    {
        [customTable reloadData];
    }
}

-(IBAction) onClickDelete
{
	DBManager* manager = [DBManager sharedManager];
    
    int rows=0;

    id <NSFetchedResultsSectionInfo> sectionInfo = nil;
//    NSFetchedResultsController *resultsController;
//    if (searchEnabled)
//    {
//        resultsController = manager.searchFetchedResultsController;
//        sectionInfo = [[manager.searchFetchedResultsController sections] objectAtIndex:0];
//        
//        rows = [sectionInfo numberOfObjects];
//    }
//    else
//    {
//        resultsController = manager.fetchedResultsController;
//        sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
//        
//      //  [editListArray count];
//        rows = [editListArray count];
//        
//    }
//    
    rows = [editListArray count];
 //   rows = [sectionInfo numberOfObjects];
	
	NSManagedObjectContext *context = nil;
	context = [manager managedObjectContext];
	
    
	for (int i=0; i<rows; i++)
	{
        DBJottTable *managedObject;
        
   //      managedObject = [resultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];

//        if(searchEnabled)
//        {
//        managedObject = [resultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
//        }
//        else
//        {
//        managedObject=[editListArray objectAtIndex:i];
//        }
        
         managedObject=[editListArray objectAtIndex:i];

		NSString* val = [self.editDictionary objectForKey:managedObject.name];
		if (val != nil && [val length] > 0)
		{
			NSString* filePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
			NSFileManager* file = [NSFileManager defaultManager];
			if ([file fileExistsAtPath:filePath isDirectory:NO])
			{
				[file removeItemAtPath:filePath error:nil];
			}
			
			NSString* filePathText = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,managedObject.name];
			
			if ([file fileExistsAtPath:filePathText isDirectory:NO])
			{
				[file removeItemAtPath:filePathText error:nil];
			}

			[context deleteObject:managedObject];
		}
	}
	
	[[DBManager sharedManager] saveContext];

	[self onClickEdit];
	
}


#pragma mark -
#pragma mark Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (currentSelected == indexPath.row)
	{
		return 133.0;
	}
	return 80.0;
}

-(void) expandCell:(NSArray*)arr
{
    [self.customTable beginUpdates];
    [self.customTable reloadRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.customTable endUpdates];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
		//return 1;
	DBManager* manager = [DBManager sharedManager];
    id <NSFetchedResultsSectionInfo> sectionInfo=nil;
	if (self.searchDisplayController.searchResultsTableView == tableView)
	{
        
		sectionInfo = [[manager.searchFetchedResultsController sections] objectAtIndex:0];
        rowNum = [sectionInfo numberOfObjects];
        
	}
	else 
	{
		sectionInfo = [[manager.fetchedResultsController sections] objectAtIndex:0];
		rowNum = [sectionInfo numberOfObjects];
      
	}
    
    if(customTable.editing)
    {
        DBJottTable *managedObject = nil;
        NSArray *manageObject=[sectionInfo objects];
        if(editListArray)
        {
            [editListArray release];
            editListArray=nil;
        }
        editListArray=[[NSMutableArray alloc] init];
        for(int count=0;count<rowNum;count++)
        {
            managedObject = [manageObject objectAtIndex:count];
            listCell.managedObject = managedObject;//managedObject.flag
            int ver=[listCell.managedObject.flag integerValue];
            if(!ver==1)
            {
                [editListArray addObject:managedObject];
            }
        }
        rowNum=[editListArray count];
    }
    return rowNum;
}
//- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    [super setEditing:editing animated:animated];
//}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSLog(@"cellForRowAtIndexPath");
    
    static NSString *CellIdentifier = @"UIListCell";
    
    UITableViewCell *cell = nil;
	DBManager* manager = [DBManager sharedManager];
    DBJottTable *managedObject = nil;
	if (self.searchDisplayController.searchResultsTableView == tableView)
	{
        if(customTable.editing)
        {
            managedObject=[editListArray objectAtIndex:indexPath.row];
        }
        else
        {
            managedObject = [manager.searchFetchedResultsController objectAtIndexPath:indexPath];
        }
       // managedObject = [manager.searchFetchedResultsController objectAtIndexPath:indexPath];
	}
	else 
	{
        if(customTable.editing)
        {
            managedObject=[editListArray objectAtIndex:indexPath.row];
        }
        else
        {
		managedObject = [manager.fetchedResultsController objectAtIndexPath:indexPath];
        }
        
    //    managedObject = [manager.fetchedResultsController objectAtIndexPath:indexPath];
        
	}
	
    listCell = (UIListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (listCell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil];
        listCell = [array objectAtIndex:0];
        [listCell setDelegatedList:self];
    }
    
    //[listCell.btnPlay addTarget:self action:@selector(onClickPlay:) forControlEvents:UIControlEventTouchUpInside];
    //[listCell.btnFlag addTarget:self action:@selector(onclickFlag:) forControlEvents:UIControlEventTouchUpInside];
    listCell.btnPlay.tag = indexPath.row;
    listCell.btnFlag.tag = indexPath.row;
    listCell.managedObject = managedObject;
    [listCell flagSelected:nil];
    listCell.isEditing = !customTable.editing;
   // listCell.isEditing=YES;
    listCell.idx = indexPath.row;
    listCell.isExpanded = NO;
    
    if (customTable.editing)
    {
        
        NSString* value = [self.editDictionary objectForKey:managedObject.name];
        
        if (value == nil || [value length] == 0)
        {
            [listCell.btnPlay setImage:[UIImage imageNamed:@"edit_not_selected.png"] forState:UIControlStateNormal];
        }
        else
        {
            [listCell.btnPlay setImage:[UIImage imageNamed:@"edit_selected.png"] forState:UIControlStateNormal];
        }
        
        [listCell.btnPlay removeTarget:listCell action:@selector(clickPlay:) forControlEvents:UIControlEventTouchUpInside];
        [listCell.btnPlay addTarget:self action:@selector(onClickSelectInEdit:) forControlEvents:UIControlEventTouchUpInside];
        
        listCell.btnFlag.hidden = true;
    }
    else
    {
        [listCell.btnPlay removeTarget:self action:@selector(onClickSelectInEdit:) forControlEvents:UIControlEventTouchUpInside];
        [listCell.btnPlay addTarget:listCell action:@selector(clickPlay:) forControlEvents:UIControlEventTouchUpInside];
        [listCell.btnPlay setImage:[UIImage imageNamed:@"list_play_button.png"] forState:UIControlStateNormal];
        listCell.btnFlag.hidden = false;
        
    }
    
    listCell.lblTextNormal.text = [PostProcessing prePattern: managedObject.message];
    listCell.lblTextSelected.text = [PostProcessing prePattern: managedObject.message];

    if(currentSelected==indexPath.row && !customTable.editing) {
        //[listCell selectCell:YES animated:YES];
        [listCell togglePlaying:YES];
        [listCell flagSelected:YES];
    } else {
        [listCell togglePlaying:NO];
    }
    
   
    cell = (UITableViewCell *)listCell;
    
	    return cell;
}


//	// Customize the appearance of table view cells.
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    NSLog(@"cellForRowAtIndexPath");
//    
//    static NSString *CellIdentifier = @"UIiJotListCell";
//    
//    UITableViewCell *cell = nil;
//	/*
//    if (isEditing==NO && indexPath.row == rowNum-1) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"footerCell"] autorelease];
//        cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Footer.png"]] autorelease];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
//    */
//	DBManager* manager = [DBManager sharedManager];
//    DBJottTable *managedObject = nil;
//	if (self.searchDisplayController.searchResultsTableView == tableView)
//	{
//        managedObject = [manager.searchFetchedResultsController objectAtIndexPath:indexPath];
//	}
//	else 
//	{
//		managedObject = [manager.fetchedResultsController objectAtIndexPath:indexPath];
//	}
//	
//	if (indexPath.row == currentSelected && !isEditing)
//	{
//		NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"UIiJotSelectedListCell" owner:self options:nil];
//        
//        UIiJotSelectedListCell *selectedCell = (UIiJotSelectedListCell *)[array objectAtIndex:0];
//		
//		if (playerController == nil)
//			playerController = [[UIPlayerViewController alloc] initWithNibName:@"UIPlayerViewController" bundle:[NSBundle mainBundle]];
//		CGRect rect = playerController.view.frame;
//		//rect.origin.y = 25;
//		playerController.view.frame = rect;
//		//rect.origin.y = 45;
//		//[selectedCell.contentView addSubview:playerController.view];
//		[selectedCell.contentView insertSubview:playerController.view  belowSubview:selectedCell.bgView];
//        
//        
//        [selectedCell.btnStop addTarget:self action:@selector(onClickPause:) forControlEvents:UIControlEventTouchUpInside];
//        
//      //  UIPlayerViewController *second = [[UIPlayerViewController alloc] init];
//    
//        
//        if (paused == false){
//        UIImage* pauseButtonImageLarge = [UIImage imageNamed:@"list_pause_button.png"];
//        [selectedCell.btnStop setImage:pauseButtonImageLarge forState:UIControlStateNormal];
//      
//        }
//   /*     
//        if (paused == false)
//        {
//        selectedCell.btnStop.hidden=YES;
//        }
//        else{
//            
//        selectedCell.btnStop.hidden=NO;
//        }
//   */     
//        
//        [selectedCell.btnShare addTarget:self action:@selector(onclickFlag:) forControlEvents:UIControlEventTouchUpInside];
//        selectedCell.btnStop.tag = indexPath.row;
//        selectedCell.btnShare.tag = indexPath.row;
//        
//        if ([managedObject.flag intValue] == 1)
//        {
//            [selectedCell flagSelected:true];
//        }
//        else 
//        {
//            [selectedCell flagSelected:false];
//        }
//        selectedCell.lblName.text = [PostProcessing prePattern: managedObject.message];
//        
//		playerController.managedObject = managedObject;
//		playerController.delegate = self;
//		playerController.view.tag = indexPath.row;
//	
//        /*
//		[UIView beginAnimations:nil context:nil];
//		[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:playerController.view cache:YES];
//		[UIView setAnimationDuration:0.5];
//        
//        //Edited by Vineeth
//		//playerController.view.frame = rect;
//		[UIView commitAnimations];
//         */
//        //[self togglePlayer:false];
//      
//    
//        
//      
//     
//       // [self presentModalViewController:playerController animated:YES];
//                
//       // [self.view addSubview:playerController.view]; 
//       
//
//        cell = (UITableViewCell *)selectedCell;
//	}
//	else 
//	{
//        
//        UIiJotListCell *listCell = (UIiJotListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//        
//        if (listCell == nil) {
//            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"UIiJotListCell" owner:self options:nil];
//            listCell = [array objectAtIndex:0];
//        }
//        
//        [listCell.btnPlay addTarget:self action:@selector(onClickPlay:) forControlEvents:UIControlEventTouchUpInside];
//        [listCell.btnShare addTarget:self action:@selector(onclickFlag:) forControlEvents:UIControlEventTouchUpInside];
//        listCell.btnPlay.tag = indexPath.row;
//        listCell.btnShare.tag = indexPath.row;
//        
//        if ([managedObject.flag intValue] == 1)
//        {
//            [listCell flagSelected:true];
//        }
//        else 
//        {
//            [listCell flagSelected:false];
//        }
//        
//        if (indexPath.row != currentSelected)
//        {
//            if (isEditing)
//            {
//                NSString* value = [self.editDictionary objectForKey:managedObject.name];
//                
//                if (value == nil || [value length] == 0)
//                {
//                    [listCell.btnPlay setImage:[UIImage imageNamed:@"edit_not_selected.png"] forState:UIControlStateNormal];
//                }
//                else 
//                {
//                    [listCell.btnPlay setImage:[UIImage imageNamed:@"edit_selected.png"] forState:UIControlStateNormal];
//                }
//                
//                [listCell.btnPlay removeTarget:self action:@selector(onClickPlay:) forControlEvents:UIControlEventTouchUpInside];
//                [listCell.btnPlay addTarget:self action:@selector(onClickSelectInEdit:) forControlEvents:UIControlEventTouchUpInside];
//                
//                listCell.btnShare.hidden = true;
//            }
//            else 
//            {
//                [listCell.btnPlay setImage:[UIImage imageNamed:@"list_play_button.png"] forState:UIControlStateNormal];
//                listCell.btnShare.hidden = false;
//            }
//        }
//        
//        listCell.lblName.text = [PostProcessing prePattern: managedObject.message];
//        
//        cell = (UITableViewCell *)listCell;
//	}
//	
//    return cell;
//}



//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
////    if (isEditing) {
////        return [[[UIImageView alloc] initWithImage:nil] autorelease];
////    }
//    
//    return [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Footer.png"]] autorelease];
//}

//- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if(listCell.isEditing)
    {
        if(currentSelected==indexPath.row && !customTable.editing)//audio playinf
        {
           return UITableViewCellEditingStyleNone; 
        }
        else
        {
         return  UITableViewCellEditingStyleDelete;
        }
    }
    else
        return UITableViewCellEditingStyleNone;
    //UIListCell* cell = (UIListCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
//	if (tableView.editing) {
//        return UITableViewCellEditingStyleNone;
//    }
    


}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(listCell.isEditing)
    {
        if(currentSelected==indexPath.row && !customTable.editing)//audio playinf
        {
            return NO;
        }
        else
        {
            return  YES;
        }
    }
    return NO;
}

- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


	// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
    if (editingStyle == UITableViewCellEditingStyleDelete) {
			// Delete the managed object for the given index path
		DBManager* manager = [DBManager sharedManager];
        NSManagedObjectContext *context = nil;
		if (self.searchDisplayController.searchResultsTableView == tableView)
		{
			context = [manager.searchFetchedResultsController managedObjectContext];
		}
		else 
		{
			context = [manager.fetchedResultsController managedObjectContext];
		}
        NSFileManager* file = [NSFileManager defaultManager];
			//DBJottTable *managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0]];
		DBJottTable *managedObject = nil;
		if (self.searchDisplayController.searchResultsTableView == tableView)
		{
			managedObject = (DBJottTable*)[manager.searchFetchedResultsController objectAtIndexPath:indexPath];
		}
		else 
		{
			managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:indexPath];
		}
        
        
        NSString* filePath = [NSString stringWithFormat:@"%@/%@.m4a",RECORDINGS_FOLDER ,managedObject.name];
        if ([file fileExistsAtPath:filePath isDirectory:NO])
        {
            [file removeItemAtPath:filePath error:nil];
        }
        
		NSString* filePathText = [NSString stringWithFormat:@"%@/%@.txt",RECORDINGS_FOLDER ,managedObject.name];
		
		if ([file fileExistsAtPath:filePathText isDirectory:NO])
        {
            [file removeItemAtPath:filePathText error:nil];
        }
		
			//[context deleteObject:[manager.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:indexPath.section inSection:0]]];
		if (self.searchDisplayController.searchResultsTableView == tableView)
			[context deleteObject:[manager.searchFetchedResultsController objectAtIndexPath:indexPath]];
		else 
			[context deleteObject:[manager.fetchedResultsController objectAtIndexPath:indexPath]];
        
			// Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            DLog(@"Unresolved error %@, %@", error, [error userInfo]);
            //commented check log
           // abort();
        }
        
        [customTable reloadData];
        //rowNum--;
    }   
		//[customTable reloadData];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
		// The table view should not be re-orderable.
    return NO;
}

/*
-(void) closeCurrentPlayer:(UITableView *)tableView {
    if(currentCell!=nil || currentSelected>-1) {
        NSInteger idx = currentSelected;
        currentSelected = -1;
        [self.customTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:idx inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    currentCell = nil;
    currentSelected = -1;
}
 */

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	//[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:TRUE];
    
    //[self closeCurrentPlayer:tableView];
	
    //UIListCell* cell = (UIListCell*)currentCell;
    //[cell selectCell:YES animated:YES];

    //by EKBPGK Ticket #62
    if(isVisibleDetalListPlayer)
        return;
    //
    
	if (customTable.editing)
	{
		UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.tag = indexPath.row;
		[self onClickSelectInEdit:btn];
		if (searchEnabled) {
            [self.searchDisplayController.searchResultsTableView reloadData];
        }
        else
        {
            [customTable reloadData];
        }
		return;
	}
	
    
    
    if (detailController == nil)
    {
        detailController = [[UIiJotDetailViewController alloc] initWithNibName:@"UIiJotDetailViewController" bundle:[NSBundle mainBundle]];
    }
    
	DBManager* manager = [DBManager sharedManager];
	DBJottTable *managedObject = nil;
	if (self.searchDisplayController.searchResultsTableView == tableView)
		managedObject = (DBJottTable*)[manager.searchFetchedResultsController objectAtIndexPath:indexPath];
	else 
		managedObject = (DBJottTable*)[manager.fetchedResultsController objectAtIndexPath:indexPath];
	
	detailController.managedObject = managedObject;
	detailController.matchPattern = false;
    detailController.directAccess = true;
    detailController.saveButtonOn = false;
	
	if (!tableView.editing)
	{
		detailController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
		[self presentViewController:detailController animated:YES completion:^{
            // Nothing to do
        }];
	}
}


#pragma mark -
#pragma mark Fetched results controller delegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller 
{	
    NSLog(@"controllerDidChangeContent");
    DBManager* manager = [DBManager sharedManager];
	if (manager.fetchedResultsController == controller)
	{
        
   
		//[customTable reloadData];

	}
	else 
	{
		[self.searchDisplayController.searchResultsTableView reloadData];
	}
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    NSLog(@"controllerWillChangeContent");
    /*
	DBManager* manager = [DBManager sharedManager];
	if (manager.fetchedResultsController == controller)
	{
		[customTable beginUpdates];	
	}
	else 
	{
		[self.searchDisplayController.searchResultsTableView beginUpdates];
	}
     */
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	NSLog(@"didChangeSection");
    /*
    UITableView* tTable = nil;
	DBManager* manager = [DBManager sharedManager];
	if (manager.fetchedResultsController == controller)
	{
		tTable = self.customTable;
	}
	else 
	{
		tTable = self.searchDisplayController.searchResultsTableView;
	}
	
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tTable insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tTable deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
     */
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    NSLog(@"didChangeObject");
    /*
	DBManager* manager = [DBManager sharedManager];
	UITableView *tableView = nil;
	
	if (manager.fetchedResultsController == controller)
	{
		tableView = customTable;
	}
	else 
	{
		tableView = self.searchDisplayController.searchResultsTableView;
	}
    
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
     */
}


#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
	[self searchText:searchString];
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    return YES;
}

- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller
{
	
}

- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller
{
	searchEnabled = true;
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller
{

}

- (void) searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
	searchEnabled = false;
	[customTable reloadData];
}

-(void) searchText:(NSString*) str
{
	[[DBManager sharedManager] findResult:str];
}


-(void) audioComplete
{
	[self onClickStop:nil];
}
@end
