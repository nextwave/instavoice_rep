//
//  UISettingsViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UISettingsViewController.h"
#import "InstaVoiceAppDelegate.h"
#include <sys/xattr.h>


@interface UISettingsViewController (Private) 

-(void) onAutoSaveChange:(UISwitch*) swh;
-(void) onAutoOnChange:(UISwitch*) swh;
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL :(u_int8_t)mattrvalue;
-(void) onIcloudSyncValueChanged:(UISwitch*)swh;
-(void) onRecordOnlyValueChange:(UISwitch*) swh;
-(void) onClickLanguage:(UIButton*) btn;

@end

@implementation UISettingsViewController (Private)

-(UIBottomMenuBarViewController *)returnBottom
{
    return bottomBar;
}

-(void) onAutoOnChange:(UISwitch*) swh
{
	SettingsManager* settings = [SettingsManager sharedManager];
	settings.autoOn = swh.on;
    [settings saveSettings];
	[customTable reloadData];
}

-(void) onAutoSaveChange:(UISwitch*) swh
{
	SettingsManager* settings = [SettingsManager sharedManager];
	settings.autoSave = swh.on;
    [settings saveSettings];
	[customTable reloadData];
}

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL :(u_int8_t)mattrvalue
{
    
    const char* filePath = [[URL path] fileSystemRepresentation];
    
    const char* attrName = "com.apple.MobileBackup";
    u_int8_t attrValue = 1;
    
    attrValue = mattrvalue;
    int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
    return result == 0;
}

-(void) onIcloudSyncValueChanged:(UISwitch*)swh
{
    SettingsManager* settings = [SettingsManager sharedManager];
	settings.icloudSync = swh.on;
	[customTable reloadData];
    
    NSString *path1 = RECORDINGS_FOLDER;
    NSURL *url = [NSURL fileURLWithPath:path1];
    
    [UtilityManager createDirectory];
    
    if (YES == swh.on) {
        [self addSkipBackupAttributeToItemAtURL:url:0];
    }
    else
    {
        [self addSkipBackupAttributeToItemAtURL:url:1];
    }
}

-(void) onRecordOnlyValueChange:(UISwitch*) swh
{
	SettingsManager* settings = [SettingsManager sharedManager];
	settings.recordOnly = swh.on;
    [settings saveSettings];
	[customTable reloadData];
}

-(void) onClickLanguage:(UIButton*) btn
{
	if (detailController == nil)
		detailController = [[UISettingsDetailViewController alloc] initWithNibName:@"UISettingsDetailViewController" bundle:[NSBundle mainBundle]];
    
	detailController.type = eLanguage;
    detailController.realDelegate=self;
    
	[self.navigationController pushViewController:detailController animated:YES];			
	[detailController customRefresh];
}
@end


@implementation UISettingsViewController
@synthesize customTable;
@synthesize tmpDetailCell;
@synthesize tmpCheckBoxCell;
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = LOC(@"settings.title");
	self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
	[customTable setBackgroundColor:[UIColor clearColor]];
	[bottomBar.btnSettings setSelected:TRUE];
}


- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[customTable reloadData];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    self.settingsLabel.text = [loc Settings:lang];

	@try 
	{
		[customTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
	}
	@catch (NSException * e) 
	{
		
	}
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [[SettingsManager sharedManager] saveSettings];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[logController release];
	[detailController release];
	[customTable release];
    [_settingsLabel release];
    [super dealloc];
}
	 
#pragma mark -
#pragma mark Table delegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
    self.settingsLabel.text = [loc Settings:lang];

    if (indexPath.row == 0)
	{
		static NSString *cellLarge = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellLarge];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
		
		NSString* language = [loc englishUS:lang];
		
		if ([settings.language compare:@"en_GB"] == NSOrderedSame)
		{
			language = [loc englishUK:lang];
		}
		else if ([settings.language compare:@"en-AU"] == NSOrderedSame)
		{
			language = [loc englishAU:lang];

		}
		else if ([settings.language compare:@"fr_FR"] == NSOrderedSame)
            
		{
			language = [loc French:lang];
		}
		else if ([settings.language compare:@"de_DE"] == NSOrderedSame)
		{
			language = [loc German:lang];
		}
		else if ([settings.language compare:@"it_IT"] == NSOrderedSame)
		{
			language = [loc Italian:lang];
		}
		else if ([settings.language compare:@"es_ES"] == NSOrderedSame)
		{
			language = [loc Spanish:lang];
		}
		else if ([settings.language compare:@"ja_JP"] == NSOrderedSame)
		{
			language = [loc japanese:lang];
		}
		else if ([settings.language compare:@"cn_MA"] == NSOrderedSame)
		{
			language = [loc Mandarin:lang];
		}
		cell.lblText.text = [loc Language:lang];
		cell.lblDescr.text = language;
        return cell;
	}
	else if (indexPath.row == 1)
	{
		static NSString *cellsmall = @"UICheckBoxCell";
        
        UICheckBoxCell *cell = (UICheckBoxCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICheckBoxCell" owner:self options:nil];
            cell = self.tmpCheckBoxCell;
            self.tmpCheckBoxCell = nil;
        }
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];

        cell.lblText.text = [loc RecordOnly:lang];
		cell.chkValue.on = settings.recordOnly;
		[cell.chkValue addTarget:self action:@selector(onRecordOnlyValueChange:) forControlEvents:UIControlEventValueChanged];
        return cell;
	}
	else if (indexPath.row == 2)
	{
		static NSString *cellsmall = @"UICheckBoxCell";
        
        UICheckBoxCell *cell = (UICheckBoxCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICheckBoxCell" owner:self options:nil];
            cell = self.tmpCheckBoxCell;
            self.tmpCheckBoxCell = nil;
        }
        cell.lblText.text = @"iCloud sync";
		cell.chkValue.on = settings.icloudSync;
		[cell.chkValue addTarget:self action:@selector(onIcloudSyncValueChanged:) forControlEvents:UIControlEventValueChanged];
        return cell;
	}
	else if (indexPath.row == 3)
	{
		static NSString *cellsmall = @"UICheckBoxCell";
        
        UICheckBoxCell *cell = (UICheckBoxCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICheckBoxCell" owner:self options:nil];
            cell = self.tmpCheckBoxCell;
            self.tmpCheckBoxCell = nil;
        }
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];

        cell.lblText.text = [loc ListenonStart:lang];
		cell.chkValue.on = settings.autoOn;
		[cell.chkValue addTarget:self action:@selector(onAutoOnChange:) forControlEvents:UIControlEventValueChanged];
        return cell;
	}
    else if (indexPath.row == 4)
	{
		static NSString *cellsmall = @"UICheckBoxCell";
        
        UICheckBoxCell *cell = (UICheckBoxCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICheckBoxCell" owner:self options:nil];
            cell = self.tmpCheckBoxCell;
            self.tmpCheckBoxCell = nil;
        }
        cell.lblText.text =[ NSString stringWithFormat:@"Auto %@",[loc Save:lang] ];
		cell.chkValue.on = settings.autoSave;
		[cell.chkValue addTarget:self action:@selector(onAutoSaveChange:) forControlEvents:UIControlEventValueChanged];
        return cell;
	}
	else if (indexPath.row == 5)
	{
		static NSString *cellsmall = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
        cell.lblText.text = [loc dictationType:lang];
		
		if (settings.dictationIndex == 0)
		{
			cell.lblDescr.text = [loc dictation:lang];
		}
		else
		{
			cell.lblDescr.text = [loc WebSearch:lang];
		}
		
        return cell;
	}
    else if (indexPath.row == 6)
	{
		static NSString *cellsmall = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
        cell.lblText.text =[loc SearchEngine:lang];
		if (settings.searchIndex == 0)
		{
			cell.lblDescr.text = [loc SearchviaGoogle:lang];
		}
		else if (settings.searchIndex == 1)
		{
			cell.lblDescr.text = [loc SearchviaBing:lang];
		}
		else 
		{
			cell.lblDescr.text = [loc SearchviaYahoo:lang];
		}
		
        return cell;
	}
    else if (indexPath.row == 7)
	{
		static NSString *cellsmall = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
        cell.lblText.text = [loc ChangeLogin:lang];
        cell.lblDescr.text = @"";
		cell.imgButton.hidden = false;
        
        return cell;
	}
	else if (indexPath.row == 8)
	{
		static NSString *cellsmall = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
        cell.lblText.text = kAboutVersion;
		cell.lblDescr.text = kVersionDate;
		cell.imgButton.hidden = true;
		return cell;
		
	}
	else 
	{
		static NSString *cellsmall = @"UICustomDetailCell";
        
        UICustomDetailCell *cell = (UICustomDetailCell*)[customTable dequeueReusableCellWithIdentifier:cellsmall];
        //if (cell == nil) 
		{
            [[NSBundle mainBundle] loadNibNamed:@"UICustomDetailCell" owner:self options:nil];
            cell = self.tmpDetailCell;
            self.tmpDetailCell = nil;
        }
        cell.lblText.text = [loc logs:lang];
		cell.lblDescr.text = @"";
		cell.imgButton.hidden = false;
		return cell;
		
	}
    
    return nil;
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    //CGRect rectt = [tableView rectForRowAtIndexPath:indexPath];
    //DLog(@"rect %lf, %lf, %lf, %lf", rectt.origin.x, rectt.origin.y, rectt.size.width, rectt.size.height);
	
	if (detailController == nil)
		detailController = [[UISettingsDetailViewController alloc] initWithNibName:@"UISettingsDetailViewController" bundle:[NSBundle mainBundle]];
    detailController.parent = self;
	
	if (indexPath.row == 0)
    {
		detailController.type = eLanguage;
        detailController.realDelegate=self;
    }
	else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4)
    {
		return;
    }
    else if (indexPath.row == 5)
    {
		detailController.type = eDictation;
    }
	else if (indexPath.row == 6)
    {
		detailController.type = eSearchType;
    }
    else if (indexPath.row == 7)
    {
		detailController.type = eLoginType;
    }
	else if (indexPath.row == 8)
	{
		return;
	}
	else 
	{
		if (logController == nil)
		{
			logController = [[UILogsViewController alloc] initWithNibName:@"UILogsViewController" bundle:[NSBundle mainBundle]];						  
		}
		
		[self presentViewController:logController animated:YES completion:^{
            // Nothing to do
        }];
		return;
		
		
	}
    			
	[detailController customRefresh];
	[self.view addSubview:detailController.view];
	detailController.view.hidden = true;
	detailController.delegate = self;
	[self.view bringSubviewToFront:detailController.view];
	
	CGRect rect = detailController.view.frame;
	rect.origin.y = 568;
    rect.size.height = self.view.bounds.size.height;
	detailController.view.frame = rect;
	detailController.view.hidden = false;
	rect.origin.y = 0;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:detailController.view cache:YES];
	[UIView setAnimationDuration:0.5];
	detailController.view.frame = rect;
	[UIView commitAnimations];
    
	START_EXCEPTION
	[detailController.customTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
	END_EXCEPTION
	
    //[detailController.view popIn:.4 delegate:nil];
	
}

-(void) onClickDone
{
    [logController dismissViewControllerAnimated:NO completion:^{
        //Nothing to do
    }];
	[self dismissViewControllerAnimated:YES completion:^{
        //Nothing to do
    }];
}
/*
-(void) onClickReset
{
	SettingsManager* settings = [SettingsManager sharedManager];
	settings.language = nil;
	settings.recordOnly = false;
	settings.sampleRate = nil;
	settings.audioQuality = nil;
	settings.patternMatch = false;
	settings.searchIndex = 0;
	settings.dictationIndex = 0;
	[settings saveSettings];
	[settings loadSettings];
	[customTable reloadData];
}
*/

-(void) customRefresh
{
	[customTable reloadData];
   
}

@end
