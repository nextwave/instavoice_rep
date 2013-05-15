//
//  UIAboutViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIAboutViewController.h"
#import "InstaVoiceAppDelegate.h"
# import "SettingsManager.h"
@implementation UIAboutViewController
@synthesize customScroll;
@synthesize beginHereView;
@synthesize beginHereImgView;
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
    
  
    
    
	customScroll.contentSize = CGSizeMake(320, 996);
    [bottomBar.btnAbout setSelected:TRUE];
    
    bool isNotFirstLoad = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isNotFirstLoad"] boolValue];
    
    if (isNotFirstLoad == NO) {
        beginHereView.hidden = NO;
        UIImage *img1 = [UIImage imageNamed:@"begin_here_arrow_1.png"];
        UIImage *img2 = [UIImage imageNamed:@"begin_here_arrow_2.png"];
        UIImage *img3 = [UIImage imageNamed:@"begin_here_arrow_3.png"];
        beginHereImgView.animationImages = [NSArray arrayWithObjects:img1,img2,img3, nil];
        
        beginHereImgView.animationDuration = 2;
        [beginHereImgView startAnimating];
        
        [self.view bringSubviewToFront:beginHereView];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isNotFirstLoad"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer *loc = [[Localizer alloc] init];
    self.aboutLabel.text=[loc About:lang];
    self.helpButton.titleLabel.text=[loc Help:lang];
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here.png"]];
            self.image.image=[UIImage imageNamed:@"about_v2.png"];
    }  
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here.png"]];
            self.image.image=[UIImage imageNamed:@"about_v2.png"];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here.png"]];
            self.image.image=[UIImage imageNamed:@"about_v2.png"];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_fr.png"]];
         self.image.image=[UIImage imageNamed:@"about_v2_fr.png"];
         
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_de.png"]];
             self.image.image=[UIImage imageNamed:@"about_v2_de.png"];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_it.png"]];
            self.image.image=[UIImage imageNamed:@"about_v2_it.png"];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_jp.png"]];
             self.image.image=[UIImage imageNamed:@"about_v2_jp.png"];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_mn.png"]];
        self.image.image=[UIImage imageNamed:@"about_v2_mn.png"];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [ self.begin_here_image setImage:[UIImage imageNamed:@"begin_here_es.png"]];
            self.image.image=[UIImage imageNamed:@"about_v2_es.png"];
    }
   
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (beginHereImgView.isAnimating) {
        [beginHereImgView stopAnimating];
        beginHereView.hidden = YES;
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
    [self setBeginHereView:nil];
    [self setBeginHereImgView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[customScroll release];
    [beginHereView release];
    [beginHereImgView release];
    [_image release];
    [_begin_here_image release];
    [_aboutLabel release];
    [_helpButton release];
    [super dealloc];
}


-(IBAction) onClickHelp
{
	if (helpDetailController == nil)
        [helpDetailController release];
    
    helpDetailController = [[UIHelpDetailViewController alloc] initWithNibName:@"UIHelpDetailViewController" bundle:[NSBundle mainBundle]];
	[helpDetailController.customScroll scrollRectToVisible:CGRectMake(0, 0, 100, 100) animated:NO];
	[self.navigationController pushViewController:helpDetailController animated:YES];
}

-(void)onClickDone
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end
