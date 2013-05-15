//
//  UISearchViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UISearchViewController.h"


@implementation UISearchViewController
#define kGoogleURL @"http://www.google.com/search?hl=en&btnG=Search&q="
#define kBingURL @"http://www.bing.com/search?go=&form=QBLH&filt=all&q="

#define kYahooURL @"http://search.yahoo.com/search?p="

@synthesize customWeb;
@synthesize loadingView;
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    self.backBtn.titleLabel.text = [loc back:lang];
  
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
	[loadingView release];
	[customWeb release];
    [_backBtn release];
    [super dealloc];
}


#pragma mark Functions
-(IBAction) onClickDone
{
	[self dismissViewControllerAnimated:YES completion:^{
        //Nothing to do
    }];
    if ([delegate respondsToSelector:@selector(onClickSearchBack)]) {
        [delegate performSelector:@selector(onClickSearchBack)];
    }
}

-(IBAction) onClickNext
{
	[customWeb goForward];
}

-(IBAction) onClickPrevious
{
	[customWeb goBack];
}

-(void) loadWebPage:(NSString*) str
{
	if (str == nil || [str length] == 0)
		return;
	
	DLog(@"loadWebPage");
	loadingView.hidden = false;
	customWeb.hidden = true;
	NSString* strUrl = @"";
	DLog(@"getting from settings");
	NSString *queryString = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
																		   (CFStringRef)str,
																		   NULL,
																		   CFSTR("!*'();:@&=+$,/?%#[]"),
																		   kCFStringEncodingUTF8);
	
	SettingsManager* manager = [SettingsManager sharedManager];
	if (manager.searchIndex == 2)
		strUrl = [NSString stringWithFormat:@"%@%@",kYahooURL,queryString];
	else if (manager.searchIndex == 1)
		strUrl = [NSString stringWithFormat:@"%@%@",kBingURL,queryString];
	else 
	{
		strUrl = [NSString stringWithFormat:@"%@%@",kGoogleURL,queryString];
	}
	
	DLog(@"before compose url = %@", strUrl);
	
//	NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
//                                                                           strUrl,
//                                                                           NULL,
//																		   CFSTR("!*'();:@&=+$,/?%#[]"),
//                                                                           kCFStringEncodingUTF8);
	@try {
		[customWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:strUrl]]];
	}
	@catch (NSException * e) 
	{
		DLog(@"Exception in query string");
		
	}
}

#pragma mark WEb delegates
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	loadingView.hidden = true;
	customWeb.hidden = false;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	loadingView.hidden = true;
	customWeb.hidden = false;
}
@end
