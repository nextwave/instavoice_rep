//
//  UICustomProgressBarWifiViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICustomProgressBarWifiViewController.h"


@implementation UICustomProgressBarWifiViewController
@synthesize customButtonView;

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
	if (customButtonView == nil)
		customButtonView = [[UIView alloc] initWithFrame:CGRectMake(70, 42, 194, 7)];
	
	if (buttonsArray == nil)
	{
		int x = -6;
		buttonsArray = [[NSMutableArray alloc] init];
		for (int i=0; i<28; i++)
		{
			x+=7;
			UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 5, 7)];
			[buttonsArray addObject:btn];
			[btn setImage:[UIImage imageNamed:@"progress_bar_wifi_inactive.png"] forState:UIControlStateNormal];
			[btn setImage:[UIImage imageNamed:@"progress_bar_wifi_active.png"] forState:UIControlStateHighlighted];
			[btn release];
		}
	}
	
	for (int i=0; i<[buttonsArray count]; i++)
	{
		[customButtonView addSubview:[buttonsArray objectAtIndex:i]];
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
	[customButtonView release];
	[buttonsArray release];
    [super dealloc];
}


-(void) updateCounter
{
	index++;
	if (index > [buttonsArray count])
		index = 0;
	
	NSArray* subV = self.customButtonView.subviews;
	for (int i=0; i<[subV count];  i++)
	{
		UIButton* btn = [subV objectAtIndex:i];
		if (i< index)
		{
			[btn setHighlighted:TRUE];
		}
		else
		{
			[btn setHighlighted:FALSE];
		}
	}
}

-(void) startCounter
{
	if (customTimer)
	{
		[customTimer invalidate];
		customTimer = nil;
	}
	customTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
}

-(void) resetCounter
{
	if (customTimer)
	{
		[customTimer invalidate];
		customTimer = nil;
	}
}
-(void)setFalseAllBtn
{
    
    NSArray* subV = self.customButtonView.subviews;
	for (int i=0; i<[subV count];  i++)
	{
        UIButton* btn = [subV objectAtIndex:i];
        [btn setHighlighted:FALSE];
		
	}
}
-(void)showProgressBar:(float)number
{
    NSArray* subV = self.customButtonView.subviews;
	for (int i=0; i<number;  i++)
	{
		UIButton* btn = [subV objectAtIndex:i];
		if (i< 27)
		{
			[btn setHighlighted:TRUE];
		}
//		else
//		{
//			[btn setHighlighted:FALSE];
//		}
	}
}
@end
