//
//  UISettingsAddAccountViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 5/23/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UISettingsAddAccountViewController.h"
#import "WordpressManager.h"
#import "WordpressData.h"

@implementation UISettingsAddAccountViewController
@synthesize customTable;
@synthesize tmpTextCell;
@synthesize lblTitle;
@synthesize customTitle;

@synthesize strTitle;
@synthesize strContent;
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[WordpressManager sharedManager] loadSettings];
	customTable.backgroundColor = [UIColor clearColor];
}
-(void)viewDidAppear:(BOOL)animated
{    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    self.cancelBtn.titleLabel.text = [loc Cancel:lang];
    self.lblTitle.text=[loc Settings:lang];
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
	[lblTitle release];
	[customTable release];
    [_cancelBtn release];
    [super dealloc];
}

#pragma mark Functions
-(IBAction) onClickLogin
{
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	UITextFieldCell* username = (UITextFieldCell*) [customTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
	UITextFieldCell* password = (UITextFieldCell*) [customTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
	
	if ([username.txtValue.text length] == 0 || [password.txtValue.text length] == 0)
	{
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc Invalidusernameorpassword:lang]delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
	if ([[WordpressManager sharedManager] login:username.txtValue.text password:password.txtValue.text])
	{
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:username.txtValue.text, [loc Username:lang], password.txtValue.text, [loc Password:lang], nil];
        [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"wordpressTokenkey"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if (delegate == nil) {
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:LOC(@"Login Successful") delegate:self cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
            [alert show];
            [alert release];
            // SELF close is implemented via alertView:clickedButtonAtIndex method
            //[self onClickCancel];
            return;
        }
        
		NSString* tmp = self.strContent;
		DLog(@"tmp = %@", tmp);
		WordpressData* data = [[WordpressData alloc] init:self.strContent];
		
		[[WordpressManager sharedManager] post:data.strTitle message:data.strMessage];
		[[WordpressManager sharedManager] saveSettings];
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:@"Posted Successfully" delegate:delegate cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
		[self onClickCancel];
		return;
	}
	else 
	{
		UIAlertView* alert = [[UIAlertView alloc] initWithTitle:LOC(@"app.name") message:[loc wordpressAuthFail:lang]delegate:nil cancelButtonTitle:LOC(@"ok") otherButtonTitles:nil];
		[alert show];
		[alert release];
		return;
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self onClickCancel];
    }
}

-(IBAction) onClickCancel
{
    if([self respondsToSelector:@selector(dismissViewControllerAnimated)])
    {
        [self dismissViewControllerAnimated:YES completion:^{
            if (delegate!=nil && [delegate respondsToSelector:@selector(onClickWordPressBack)])
            {
                [delegate performSelector:@selector(onClickWordPressBack)];
            }
        }];
    }
    else if([self respondsToSelector:@selector(dismissModalViewControllerAnimated:)])
    {
        [self dismissViewControllerAnimated:YES completion:^{
            if (delegate!=nil && [delegate respondsToSelector:@selector(onClickWordPressBack)])
            {
                [delegate performSelector:@selector(onClickWordPressBack)];
            }
        }];
    }
    else {
        if (delegate!=nil && [delegate respondsToSelector:@selector(onClickWordPressBack)])
        {
            [delegate performSelector:@selector(onClickWordPressBack)];
        }
    }
    
}

#pragma mark -
#pragma mark Table delegate
#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	self.lblTitle.text = self.customTitle;
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer* loc = [[Localizer alloc] init];

	static NSString *cellCheckBox = @"UITextFieldCell";
	
	UITextFieldCell *cell = (UITextFieldCell*)[customTable dequeueReusableCellWithIdentifier:cellCheckBox];
		//if (cell == nil) 
	{
		[[NSBundle mainBundle] loadNibNamed:@"UITextFieldCell" owner:self options:nil];
		cell = self.tmpTextCell;
		self.tmpTextCell = nil;
	}

	if (indexPath.row == 0)
	{
		cell.lblTitle.text =[loc Username:lang];
		cell.txtValue.placeholder = [loc Enterusername:lang];
		[cell.txtValue becomeFirstResponder];
		cell.txtValue.text = [WordpressManager sharedManager].username;
	}
	else 
	{
		cell.lblTitle.text = [loc Password:lang];
		cell.txtValue.placeholder = [loc Password:lang];
		cell.txtValue.secureTextEntry = true;
		cell.txtValue.text = [WordpressManager sharedManager].password;
	}
    return cell;
	
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	
}
@end
