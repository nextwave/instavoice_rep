//
//  UISettingsDetailViewController.m
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UISettingsDetailViewController.h"
#import "SettingsManager.h"
#import <QuartzCore/QuartzCore.h>
#import "UISettingsAddAccountViewController.h"
#import "UIBottomMenuBarViewController.h"
#import "InstaVoiceAppDelegate.h"
#define kAppId						@"197176626985041"

@implementation UISettingsDetailViewController
@synthesize type;
@synthesize customTable;
@synthesize lblCustomTitle;
@synthesize tmpImageCell;
@synthesize delegate;
@synthesize grayView;
@synthesize parent;

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
	[grayView release];
	[lblCustomTitle release];
	[searchArray release];
	[dictationArray release];
	[languageNameArray release];
	[customTable release];
	[languageArray release];
    [_cancelBtn release];
    
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
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
	
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	//self.navigationController.navigationBar.tintColor = self.view.backgroundColor;
	customTable.layer.masksToBounds = YES;
    customTable.layer.cornerRadius = 10.0;
    customTable.layer.borderWidth = 1.0;
    customTable.layer.borderColor = [[UIColor clearColor] CGColor];
	
	if (languageArray == nil)
	{
		languageArray = [[NSMutableArray alloc] init];
		[languageArray addObject:@"en_US"];
		[languageArray addObject:@"en_GB"];
		[languageArray addObject:@"en-AU"];
		[languageArray addObject:@"fr_FR"];
		[languageArray addObject:@"de_DE"];	
		[languageArray addObject:@"it_IT"];
		[languageArray addObject:@"es_ES"];
		[languageArray addObject:@"ja_JP"];
		[languageArray addObject:@"cn_MA"];

		
		languageNameArray = [[NSMutableArray alloc] init];
		[languageNameArray addObject:[loc englishUS:lang]];
		[languageNameArray addObject:[loc englishUK:lang]];
		[languageNameArray addObject:[loc englishAU:lang]];
		[languageNameArray addObject:[loc French:lang]];
		[languageNameArray addObject:[loc German:lang]];
		[languageNameArray addObject:[loc Italian:lang]];
		[languageNameArray addObject:[loc Spanish:lang]];
		[languageNameArray addObject:[loc japanese:lang]];
		[languageNameArray addObject:[loc Mandarin:lang]];
	}
	
	if (loginArray == nil) {
        loginArray = [[NSMutableArray alloc] init];
		[loginArray addObject:@"WordPress"];
        
    }
	
	if (dictationArray == nil)
	{
		dictationArray = [[NSMutableArray alloc] init];
		[dictationArray addObject:[loc dictation:lang]];
		[dictationArray addObject:[loc WebSearch:lang]];
	}
	
	if (searchArray == nil)
	{
		searchArray = [[NSMutableArray alloc] init];
		[searchArray addObject:[loc SearchviaGoogle:lang]];
		[searchArray addObject:[loc SearchviaBing:lang]];
		[searchArray addObject:[loc SearchviaYahoo:lang]];
	}
	
	grayView.layer.masksToBounds = YES;
    grayView.layer.cornerRadius = 5.0;
    grayView.layer.borderWidth = 1.0;
    grayView.layer.borderColor = [[UIColor clearColor] CGColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    [super viewWillAppear:YES];
    languageNameArray = [[NSMutableArray alloc] init];
    [languageNameArray addObject:[loc englishUS:lang]];
    [languageNameArray addObject:[loc englishUK:lang]];
    [languageNameArray addObject:[loc englishAU:lang]];
    [languageNameArray addObject:[loc French:lang]];
    [languageNameArray addObject:[loc German:lang]];
    [languageNameArray addObject:[loc Italian:lang]];
    [languageNameArray addObject:[loc Spanish:lang]];
    [languageNameArray addObject:[loc japanese:lang]];
    [languageNameArray addObject:[loc Mandarin:lang]];
    [self reloadInputViews];
}
-(void)viewDidAppear:(BOOL)animated
{    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    languageNameArray = [[NSMutableArray alloc] init];
    [languageNameArray addObject:[loc englishUS:lang]];
    [languageNameArray addObject:[loc englishUK:lang]];
    [languageNameArray addObject:[loc englishAU:lang]];
    [languageNameArray addObject:[loc French:lang]];
    [languageNameArray addObject:[loc German:lang]];
    [languageNameArray addObject:[loc Italian:lang]];
    [languageNameArray addObject:[loc Spanish:lang]];
    [languageNameArray addObject:[loc japanese:lang]];
    [languageNameArray addObject:[loc Mandarin:lang]];
  //  self.cancelBtn.titleLabel.text = [loc Cancel:lang];
    
    [self.cancelBtn setTitle:[loc Cancel:lang] forState:UIControlStateNormal];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
	
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 40.0;
//	if (type == eLanguage)
//		return 40.0;
//	return 60.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	if (type == eLanguage)
		return [languageArray count];
	else  if (type == eDictation)
		return [dictationArray count];
	else  if (type == eSearchType)
		return [searchArray count];
    else  if (type == eLoginType)
		return [loginArray count];
	
	return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }

   
	int rowCount = 0;
	if (type == eLanguage)
		rowCount = [languageArray count];
	else  if (type == eDictation)
		rowCount = [dictationArray count];
	else  if (type == eSearchType)
		rowCount = [searchArray count];
	SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    
    InstaVoiceAppDelegate *appdel = [[UIApplication sharedApplication] delegate];
    [appdel.aboutController.bottomBar reloadView:lang];
    
    
    
	static NSString *cellLarge = @"UICustomImageCell";
	UICustomImageCell* cell = (UICustomImageCell*)[customTable dequeueReusableCellWithIdentifier:cellLarge];
		//if (cell == nil) 
	{
		[[NSBundle mainBundle] loadNibNamed:@"UICustomImageCell" owner:self options:nil];
		cell = self.tmpImageCell;
		self.tmpImageCell = nil;
	}
	
	cell.imgLeftIcon.image = nil;
	
    // Configure the cell...
	if (type == eLanguage)
	{
		cell.lblTitle.text =  [languageArray objectAtIndex:indexPath.row];
		if ([cell.lblTitle.text compare:settings.language] == NSOrderedSame)
		{
			[cell setCustomSelected:true];
		}
		else 
		{
			[cell setCustomSelected:false];
		}
		cell.imgLeftIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [languageArray objectAtIndex:indexPath.row]]];								
		cell.lblTitle.text =  [languageNameArray objectAtIndex:indexPath.row];

        
        
        //=================FIXED!!!!!!!!!!!
        
        
        
        
        
        if (indexPath.row >= 9) {
            cell.userInteractionEnabled = NO;
            cell.backgroundView.alpha = 0.5;
            //[cell setMaskState:YES];
        }
	
	}
    
 
	else if (type == eDictation)
	{
		cell.lblTitle.text =  [dictationArray objectAtIndex:indexPath.row];
		
		if (settings.dictationIndex == indexPath.row)
			[cell setCustomSelected:true];
		else 
			[cell setCustomSelected:false];
		
		if ([cell.lblTitle.text compare:[loc dictation:lang]] == NSOrderedSame)
		{
			cell.imgLeftIcon.image = [UIImage imageNamed:@"dictation.png"];
            
            CGRect frame = cell.lblTitle.frame;
            frame.origin.x -= 3;
            cell.lblTitle.frame = frame;
            
		}
		else 
		{
			cell.imgLeftIcon.image = [UIImage imageNamed:@"web-search.png"];
		}
		
	}
	else if (type == eSearchType)
	{
		cell.lblTitle.text =  [searchArray objectAtIndex:indexPath.row];
		
		if (settings.searchIndex == indexPath.row)
		{
			[cell setCustomSelected:true];
		}
		else 
		{
			[cell setCustomSelected:false];
		}
		
		cell.imgLeftIcon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", [cell.lblTitle.text lowercaseString]]];
	}
    else if (type == eLoginType)
	{
		 NSString *tital=  [loginArray objectAtIndex:indexPath.row];
        cell.lblTitle.text=LOC(tital);
        [cell setCustomSelected:false];
        
        if ([cell.lblTitle.text compare:@"WordPress"] == NSOrderedSame)
		{
			cell.imgLeftIcon.image = [UIImage imageNamed:@"wordpress.png"];
		}
        else if ([cell.lblTitle.text compare:@"Facebook"] == NSOrderedSame)
		{
			cell.imgLeftIcon.image = [UIImage imageNamed:@"facebook.png"];
		}
        else if ([cell.lblTitle.text compare:@"Twitter"] == NSOrderedSame)
		{
			cell.imgLeftIcon.image = [UIImage imageNamed:@"twitter.png"];
		}
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
     [self viewDidAppear:true];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
	SettingsManager* settings = [SettingsManager sharedManager];
	if (type == eLanguage)
	{
       
		settings.language =  [languageArray objectAtIndex:indexPath.row];

        UIBottomMenuBarViewController *temp=[self.realDelegate returnBottom];
[self viewDidAppear:true];        
        [temp reloadView:settings.language];
	}
	else if (type == eDictation)
	{
		settings.dictationIndex = indexPath.row;
	}
	else if (type == eSearchType)
	{
		settings.searchIndex = indexPath.row;
	}
    else if (type == eLoginType)
	{
        if(indexPath.row==0)//Wordpress login
        {
        NSString *tokenKey = [NSString stringWithFormat:@"%@Tokenkey",[loginArray objectAtIndex:settings.login]];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:tokenKey];
        settings.login = indexPath.row;
        [self performSelector:@selector(loginWordpress) withObject:nil afterDelay:0.1];
        }
       
	}
	[settings saveSettings];

	[self.customTable reloadData];
	[self performSelector:@selector(onClickBack) withObject:nil afterDelay:0.3];
	
}

#pragma mark Functions
-(void) customRefresh
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
	if (type == eLanguage)
		self.lblCustomTitle.text = [loc Language:lang];
	else if (type == eDictation)
    {
		self.lblCustomTitle.text = [loc dictation:lang];
        if (dictationArray == nil)
        {
            dictationArray = [[NSMutableArray alloc] init];
            [dictationArray addObject:[loc dictation:lang]];
            [dictationArray addObject:[loc WebSearch:lang]];
        }
        else
        {
            [dictationArray replaceObjectAtIndex:0 withObject:[loc dictation:lang]];
            [dictationArray replaceObjectAtIndex:1 withObject:[loc WebSearch:lang]];
            
        }
    }
	else if (type == eSearchType)
    {
		self.lblCustomTitle.text = [loc WebSearch:lang];
        if (searchArray == nil)
        {
            searchArray = [[NSMutableArray alloc] init];
            [searchArray addObject:[loc SearchviaGoogle:lang]];
            [searchArray addObject:[loc SearchviaBing:lang]];
            [searchArray addObject:[loc SearchviaYahoo:lang]];
        }
        else
        {
            [searchArray replaceObjectAtIndex:0 withObject:[loc SearchviaGoogle:lang]];
            [searchArray replaceObjectAtIndex:1 withObject:[loc SearchviaBing:lang]];
            [searchArray replaceObjectAtIndex:2 withObject:[loc SearchviaYahoo:lang]];
            
        }
    }
    else if (type == eLoginType)
    {
		self.lblCustomTitle.text = [loc ChangeLogin:lang];
    }
	[customTable reloadData];
}

-(IBAction) onClickBack
{
		//[self.navigationController popViewControllerAnimated:YES];
	self.view.hidden = false;
		//[self.view popOut:.4 delegate:nil];
	
	CGRect rect = self.view.frame;
	rect.origin.y = 568;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	[UIView setAnimationDuration:0.5];
	self.view.frame = rect;
	[UIView commitAnimations];
	
	[delegate customRefresh];
}


-(void)loginWordpress
{
    UISettingsAddAccountViewController* cont = [[UISettingsAddAccountViewController alloc] initWithNibName:@"UISettingsAddAccountViewController" bundle:[NSBundle mainBundle]];
    cont.customTitle = LOC(@"Wordpress");
    cont.strTitle = @"";
    
    cont.strContent = @"";
    [parent presentModalViewController:cont animated:YES];
    [cont release];
}

@end
