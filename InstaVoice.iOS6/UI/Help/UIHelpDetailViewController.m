//
//  UIHelpDetailViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIHelpDetailViewController.h"
#import "SettingsManager.h"

@implementation UIHelpDetailViewController
@synthesize customScroll;
@synthesize helpImageView;


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
    
    NSString *imgName = LOC(@"help.detail.view.img");
    
    
    
    SettingsManager *settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer *loc = [[Localizer alloc]init ];
    
    self.helpLabel.text= [loc Help:lang];
  //  self.backButton.titleLabel.text=[loc back:lang];
    [self.backButton setTitle:[loc back:lang] forState:UIControlStateNormal];
    if ([lang compare:@"en_GB"] == NSOrderedSame || [settings.language compare:@"en-AU"] == NSOrderedSame)
    {
        imgName = LOC(@"Help_View_enuk.png");
    }
    else if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        imgName = @"Help_View_fr.png";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
         imgName = @"Help_View_fr.png";
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
         imgName = @"Help_View_de.png";
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
         imgName = @"Help_View_it.png";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        imgName = @"Help_View_jp.png";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
         imgName = @"Help_View_mn.png";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        imgName = @"Help_View_es.png";    }

    
    UIImage *img = [UIImage imageNamed:imgName];
    helpImageView.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    helpImageView.image = img;
    customScroll.contentSize = CGSizeMake(img.size.width, img.size.height);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSString *imgName = LOC(@"help.detail.view.img");
    
    
    
    SettingsManager *settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer *loc = [[Localizer alloc]init ];
    
    self.helpLabel.text= [loc Help:lang];
    self.backButton.titleLabel.text=[loc back:lang];
    if ([lang compare:@"en_GB"] == NSOrderedSame || [settings.language compare:@"en-AU"] == NSOrderedSame)
    {
        imgName = LOC(@"Help_View_en.png");
    }
    else if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        imgName = @"Help_View_en.png";
    }
    
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        imgName = @"Help_View_fr.png";
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        imgName = @"Help_View_de.png";
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        imgName = @"Help_View_it.png";
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        imgName = @"Help_View_jp.png";
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        imgName = @"Help_View_mn.png";
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        imgName = @"Help_View_es.png";    }
    
    
    UIImage *img = [UIImage imageNamed:imgName];
    helpImageView.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    helpImageView.image = img;
    customScroll.contentSize = CGSizeMake(img.size.width, img.size.height);
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
    [self setHelpImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[customScroll release];
    [helpImageView release];
    [_helpLabel release];
    [_backButton release];
    [super dealloc];
}

#pragma mark Functions
-(IBAction) onClickBack
{
	[self.navigationController popViewControllerAnimated:YES];
}
@end
