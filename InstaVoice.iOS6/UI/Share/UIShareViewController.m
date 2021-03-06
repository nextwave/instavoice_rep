//
//  UIShareViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIShareViewController.h"
#import "SettingsManager.h"
#import <QuartzCore/QuartzCore.h>

typedef enum tblRowIndices {
	TR_COPY=0,
    TR_CALENDAR,
    TR_SEARCH,
    TR_FIND,
    TR_EMAIL,
    TR_MESSAGE,
    TR_REMINDER,
    TR_FACEBOOK,
    TR_TWITTER,
    TR_WORDPRESS,
    TR_FLAG
}TblRowIndices;

@implementation UIShareViewController

@synthesize tmpShareCell;
@synthesize customTable;
@synthesize dimView;
@synthesize delegate;
@synthesize managedObject;
@synthesize msg;

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
	
	dimView.layer.masksToBounds = YES;
    dimView.layer.cornerRadius = 5.0;
    dimView.layer.borderWidth = 1.0;
    dimView.layer.borderColor = [[UIColor clearColor] CGColor];
    
    self.view.hidden = YES;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
  //  self.cancelBtn.titleLabel.text = [loc Cancel:lang];
    [self.cancelBtn setTitle:[loc Cancel:lang] forState:UIControlStateNormal];
}
-(void)reloadCustomTable
{
	[customTable reloadData];
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
	[customTable release];
    [dimView release];
    [_cancelBtn release];
    [super dealloc];
}


#pragma mark -
#pragma mark Table delegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SettingsManager* settings = [SettingsManager sharedManager];

    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];
	static NSString *cellLarge = @"UIShareCell";
	
	UIShareCell *cell = (UIShareCell*)[tableView dequeueReusableCellWithIdentifier:cellLarge];
		//if (cell == nil) 
	{
		[[NSBundle mainBundle] loadNibNamed:@"UIShareCell" owner:self options:nil];
		cell = self.tmpShareCell;
		self.tmpShareCell = nil;
	}

	if (indexPath.row == TR_COPY)
	{
		cell.lblText.text = [loc CopytoClipboard:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"copy.png"];
	}
	else if (indexPath.row == TR_CALENDAR)
	{
		cell.lblText.text = [loc CalendarEvent:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"calender.png"];
	}
	else if (indexPath.row == TR_SEARCH)
	{
		if (settings.searchIndex == 0)
		{
			cell.lblText.text =[loc SearchviaGoogle:lang];
			cell.imgIcon.image = [UIImage imageNamed:@"google.png"];
		}
		else if (settings.searchIndex == 1)
		{
			cell.lblText.text = [loc SearchviaBing:lang];
			cell.imgIcon.image = [UIImage imageNamed:@"bing.png"];
		}
		else 
		{
			cell.lblText.text = [loc SearchviaYahoo:lang];
			cell.imgIcon.image = [UIImage imageNamed:@"yahoo.png"];
		}
		
	}
	else if (indexPath.row == TR_FIND)
	{
		cell.lblText.text =[loc findViaMaps:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"search.png"];
	}
	else if (indexPath.row == TR_EMAIL)
	{
		cell.lblText.text = [loc Email:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"email.png"];
	}
	else if (indexPath.row == TR_MESSAGE)
	{
		cell.lblText.text = [loc Message:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"sms.png"];
	}
	else if (indexPath.row == TR_REMINDER)
	{
		cell.lblText.text = [loc Reminder:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"reminder.png"];
	}
	else if (indexPath.row == TR_FACEBOOK)
	{
		cell.lblText.text = LOC(@"Facebook");
		cell.imgIcon.image = [UIImage imageNamed:@"facebook.png"];
	}
	else if (indexPath.row == TR_TWITTER)
	{
		cell.lblText.text = LOC(@"Twitter");
		cell.imgIcon.image = [UIImage imageNamed:@"twitter.png"];
	}
	else if (indexPath.row == TR_WORDPRESS)
	{
		cell.lblText.text = LOC(@"Wordpress");
		cell.imgIcon.image = [UIImage imageNamed:@"wordpress.png"];
	}
	else if (indexPath.row == TR_FLAG)
	{
		cell.lblText.text = [loc FlagNote:lang];
		cell.imgIcon.image = [UIImage imageNamed:@"flag_check.png"];
	}

	[cell setCustomSelected:TRUE];
    return cell;
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	

	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self onClickCancel];
    
	if (indexPath.row == TR_COPY)
	{
        if ([delegate respondsToSelector:@selector(doCopy:)]) {
            [delegate performSelector:@selector(doCopy:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_CALENDAR)
	{
        if ([delegate respondsToSelector:@selector(calenderThis:)]) {
            [delegate performSelector:@selector(calenderThis:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_SEARCH)
	{
        if ([delegate respondsToSelector:@selector(doSearch:)]) {
            [delegate performSelector:@selector(doSearch:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_FIND)
	{
        if ([delegate respondsToSelector:@selector(doMap:)]) {
            [delegate performSelector:@selector(doMap:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_EMAIL)
	{
        if ([delegate respondsToSelector:@selector(sendEmail:)]) {
            [delegate performSelector:@selector(sendEmail:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_MESSAGE)
	{
        if ([delegate respondsToSelector:@selector(sendSMS:)]) {
            [delegate performSelector:@selector(sendSMS:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_REMINDER)
	{
        if ([delegate respondsToSelector:@selector(remindMe:)]) {
            [delegate performSelector:@selector(remindMe:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_FACEBOOK)
	{
        if ([delegate respondsToSelector:@selector(sendFacebook:)]) {
            [delegate performSelector:@selector(sendFacebook:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_TWITTER)
	{
        if ([delegate respondsToSelector:@selector(sendTweet:)]) {
            [delegate performSelector:@selector(sendTweet:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_WORDPRESS)
	{
        if ([delegate respondsToSelector:@selector(onWordPress:)]) {
            [delegate performSelector:@selector(onWordPress:) withObject:self.msg];
        }
	}
	else if (indexPath.row == TR_FLAG)
	{
		self.managedObject.flag = [NSNumber numberWithBool:TRUE];
		[[DBManager sharedManager] saveContext];
		
        SettingsManager* settings = [SettingsManager sharedManager];
        NSString * lang = settings.language;
        Localizer* loc = [[Localizer alloc] init];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc Flagged:lang]  delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
    
    [self onClickCancel];
}

#pragma mark Functions
-(IBAction) onClickCancel
{

	CGRect rect = self.view.frame;
	rect.origin.y = -568;
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.view cache:YES];
	[UIView setAnimationDuration:0.5];
	self.view.frame = rect;
	[UIView commitAnimations];
}

@end
