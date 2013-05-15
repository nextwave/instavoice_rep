//
//  UIBottomMenuBarViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIBottomMenuBarViewController.h"
#import "InstaVoiceAppDelegate.h"
#import "ZipArchive.h"

@implementation UIBottomMenuBarViewController

@synthesize btnSettings;
@synthesize btnAbout;
@synthesize btnList;
@synthesize btnHome;
@synthesize btnShare;

@synthesize delegate;
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

//comment added for changing file to put into repo=)
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    [self reloadView:lang];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        self.bottomImage. image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_en.png"];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_fr.png"];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_de.png"];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_it.png"];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_jp.png"];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_mn.png"];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_es.png"];
    }
}
- (void) reloadView :(NSString*) lang
{
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        self.bottomImage. image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_en.png"];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_fr.png"];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_de.png"];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_it.png"];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_jp.png"];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_mn.png"];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        self.bottomImage.image=[UIImage imageNamed:@"menu_settings_es.png"];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[btnSettings release];
	[btnAbout release];
	[btnList release];
	[btnHome release];
	[btnShare release];
    [_bottomImage release];
    [super dealloc];
}

#pragma mark Functions
-(IBAction) onClickSettings:(UIButton*) btn
{
	if ([btn isSelected]) return;
	
	InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
	[appDelegate showSettings];
//	[self.view reloadInputViews];
	if ([delegate respondsToSelector:@selector(onClickStop:)])
	{
		//[delegate onClickStop:nil];
	}
}

-(IBAction) onClickAbout:(UIButton*) btn
{
	if ([btn isSelected]) return;
	
	InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
	[appDelegate showAbout];
	[self.view reloadInputViews];
	if ([delegate respondsToSelector:@selector(onClickStop:)])
	{
		//[delegate onClickStop:nil];
	}
}

-(IBAction) onClickHome:(UIButton*) btn
{
	//if ([btn isSelected]) return;
	
	InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
	[appDelegate showHome];
	[self.view reloadInputViews];
	if ([delegate respondsToSelector:@selector(onClickStop:)])
	{
		//[delegate onClickStop:nil];
	}
}

-(IBAction) onClickList:(UIButton*) btn
{
    
        
	if ([btn isSelected]) return;
	
	InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
	[appDelegate showList];
	[self.view reloadInputViews];
	if ([delegate respondsToSelector:@selector(onClickStop:)])
	{
		//[delegate onClickStop:nil];
	}
}

-(IBAction) onClickShare:(UIButton*) btn
{
       
     UIiJotDetailViewController *c=[[UIiJotDetailViewController alloc] init];
     [c updateThis];
     [c release];
    
    [self.view reloadInputViews];
	if ([btn isSelected]) return;
	[UtilityManager createDirectory];
	
	InstaVoiceAppDelegate* appDelegate = [InstaVoiceAppDelegate appDelegate];
	[appDelegate showShare];
	
	if ([delegate respondsToSelector:@selector(onClickStop:)])
	{
		//[delegate onClickStop:nil];
	}
}


-(void) customEnable:(bool) val
{
	
      
    self.btnSettings.enabled = val;
    self.btnSettings.userInteractionEnabled = val;
	self.btnAbout.enabled = val;
    self.btnAbout.userInteractionEnabled = val;
	self.btnList.enabled = val;
    self.btnList.userInteractionEnabled = val;
	self.btnHome.enabled = val;
    self.btnHome.userInteractionEnabled = val;
    self.btnShare.enabled = val;
    self.btnShare.userInteractionEnabled = val;
	
}
@end
