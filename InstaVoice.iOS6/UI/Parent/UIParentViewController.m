    //
//  UIParentViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIParentViewController.h"


@implementation UIParentViewController

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (bottomBar == nil)
	{
		bottomBar = [[UIBottomMenuBarViewController alloc] initWithNibName:@"UIBottomMenuBarViewController" bundle:[NSBundle mainBundle]];
	}

	bottomBar.delegate = self;
    bottomBar.view.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
	[self.view addSubview:bottomBar.view];
	
	CGRect rect = bottomBar.view.frame;
	rect.origin.y = self.view.frame.size.height - bottomBar.view.frame.size.height;
	bottomBar.view.frame = rect;
	
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_en.png"];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_en.png"];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_fr.png"];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_de.png"];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_it.png"];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_jp.png"];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_mn.png"];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
         self.bottomBar.bottomImage. image=[UIImage imageNamed:@"menu_settings_es.png"];
    }
    
}
- (BOOL)is4InchRetina
{
    if ((![UIApplication sharedApplication].statusBarHidden && (int)[[UIScreen mainScreen] applicationFrame].size.height == 548) || ([UIApplication sharedApplication].statusBarHidden && (int)[[UIScreen mainScreen] applicationFrame].size.height == 568))
        return YES;
    
    return NO;
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

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
	[bottomBar release];
    [super dealloc];
}


@end
