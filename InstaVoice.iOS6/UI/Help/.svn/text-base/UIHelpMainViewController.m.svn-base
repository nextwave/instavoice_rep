//
//  UIHelpMainViewController.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIHelpMainViewController.h"
#import "UIiJotMainViewController.h"
#import "InstaVoiceAppDelegate.h"

#define WThreshold 50 //如果左右划动超过该值，即更换帮助图片。
@implementation UIHelpMainViewController
@synthesize btnHelp;
@synthesize backView;
@synthesize delegate;

bool isHelpOpen;  // iantonov: Check the current state to control the bounding clicks for additional window

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
UIImageView *imgView ;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    NSLog(@"viewDidLoad in UIHelpMainViewController");
	helpIconIndex = 0;
    firstTouch = CGPointMake(0, 0);
    
    NSLog(lang);
    
	int totalHelpCount = 11;

	if (helpArray == nil)
	{
		helpArray = [[NSMutableArray alloc] init];
		for (int i=0; i<totalHelpCount; i++)
		{
          /*  NSString* imgName = [NSString stringWithFormat:@"help.img.%d", i];
            NSString* pngName = LOC(imgName);*/
          NSString* pngName = [loc helpImage:lang :i];
            UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:pngName]];
			[helpArray addObject:imgView];
			[imgView release];
		}
	}

	//add the first info icon
    imgView  = [helpArray objectAtIndex:helpIconIndex];
   [backView addSubview:imgView];
    
	CGRect vwRect = backView.frame;
	vwRect.origin.y = 132;
	backView.frame = vwRect;
	
	CGRect btnRect = btnHelp.frame;
	btnRect.origin.y = 68;
	btnHelp.frame = btnRect;
   
    
   
    NSLog([NSString stringWithFormat: @" Help menu"]);
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_es.png"] forState:UIControlStateNormal];
    }
    
    
}


-(void) customHelpEnable:(bool) val
{
	
    
    self.btnHelp.enabled = val;
    self.btnHelp.userInteractionEnabled = val;
    	
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
    self.btnHelp = nil;
    self.backView = nil;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    Localizer * loc =[[Localizer alloc]init];
    CGRect frame = backView.frame;
   /* [backView removeFromSuperview];
    [backView release];
    backView =[[UIView alloc] initWithFrame:frame];
    [backView addSubview:self.help_tags];
    [self.view addSubview:backView];

    imgView  = [helpArray objectAtIndex:helpIconIndex];
    [backView addSubview:imgView];
    
	CGRect vwRect = backView.frame;
	vwRect.origin.y = 132;
	backView.frame = vwRect;
	
	CGRect btnRect = btnHelp.frame;
	btnRect.origin.y = 68;
	btnHelp.frame = btnRect; */
    NSLog([NSString stringWithFormat: @" Help menu"]);
  
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];

    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
    [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
         [self.btnHelp setImage:[UIImage imageNamed:@"help_button_fr.png"] forState:UIControlStateNormal];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
         [self.btnHelp setImage:[UIImage imageNamed:@"help_button_de.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
         [self.btnHelp setImage:[UIImage imageNamed:@"help_button_it.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_jp.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.btnHelp setImage:[UIImage imageNamed:@"help_button_mn.png"] forState:UIControlStateNormal];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
         [self.btnHelp setImage:[UIImage imageNamed:@"help_button_es.png"] forState:UIControlStateNormal];
    }
    //12 hardcoded
  //  helpArray = [[NSMutableArray alloc] init];
   for (int i=0; i<11; i++)
    {
   
        NSString* pngName = [loc helpImage:lang :i];
       /*   UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:pngName]];
        [helpArray setObject:imgView atIndexedSubscript:i];
        [imgView release];*/
        [[helpArray objectAtIndex:i]setImage:[UIImage imageNamed:pngName]];
    }
    
   //imgView  = [helpArray objectAtIndex:helpIconIndex];
    //[backView addSubview:imgView];
    
	/*CGRect vwRect = backView.frame;
	vwRect.origin.y = 132;
	backView.frame = vwRect;
	
	CGRect btnRect = btnHelp.frame;
	btnRect.origin.y = 68;
	btnHelp.frame = btnRect;*/

}

- (void)dealloc {
	[btnHelp release];
	[backView release];
	[helpArray release];
    [_help_tags release];
    [super dealloc];
}

#pragma mark -
#pragma mark Functions
#pragma mark -

-(IBAction) onClickHelpShow
{
    
    
    NSLog(@"onClickHelpShow in UIHelpMainViewController");
    UIiJotMainViewController *mainController = [InstaVoiceAppDelegate appDelegate].mainController;
    
   // mainController.beginHereView.hidden = YES;
   // Edited By VIneeth
    if(!mainController.beginHereView.hidden) {
        [UIView animateWithDuration:0.3 animations:^() {
            mainController.beginHereView.alpha = 0.0;
            [mainController customEnable:true];
        }];
    }

    
    
    if (mainController.beginHereImgView.isAnimating) {
        [mainController.beginHereImgView stopAnimating];
        mainController.beginHereView.hidden = YES;
    }
    
    
    
    
	CGRect btnRect = btnHelp.frame;
	CGRect vwRect = backView.frame;
    
    NSLog(@"btnRect%@", NSStringFromCGRect(btnRect));
     NSLog(@"vwRect is:%@", NSStringFromCGRect(vwRect));

    
    
	
	btnRect.origin.y = 132;
	vwRect.origin.y = 0;
    
    SettingsManager* settings = [SettingsManager sharedManager];
    NSString * lang = settings.language;
    NSLog([NSString stringWithFormat: @" Help menu"]);
    
    if ([lang compare:@"en_US"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text.png"]];
        
    }
    else if ([lang compare:@"en_GB"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text.png"]];
    }
    else if ([lang compare:@"en-AU"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text.png"]];
        
    }
    else if ([lang compare:@"fr_FR"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_fr.png"]];
        
    }
    else if ([lang compare:@"de_DE"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_de.png"]];
    }
    else if ([lang compare:@"it_IT"] == NSOrderedSame)
    {
       [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_it.png"]];
    }
    else if ([lang compare:@"ja_JP"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_jp.png"]];
    }
    else if ([lang compare:@"cn_MA"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_mn.png"]];
    }
    else if ([lang compare:@"es_ES"] == NSOrderedSame)
    {
        [self.help_tags setImage:[UIImage imageNamed:@"help_tags_help_text_es.png"]];
    }
    
   /* btnHelp.frame = btnRect;
    CGRect buttonFrame = CGRectMake( 10, 80, 100, 30 );
    btnHelp.frame =buttonFrame;
    CGRect buttonFrame2 = CGRectMake( 10, 80, 100, 30 );
    backView.frame = buttonFrame2;
	*/
    
    moveAnimation = YES;
    [UIView animateWithDuration:0.7 animations:^{
        btnHelp.frame = btnRect;
        backView.frame = vwRect;
    } completion:^(BOOL finished) {
        moveAnimation = NO;
    }];
     
    isHelpOpen = true; 
     
}

-(void) onClickHelpShowTwo
{
    
    
    NSLog(@"onClickHelpShowTwo in UIHelpMainViewController");
    UIiJotMainViewController *mainController = [InstaVoiceAppDelegate appDelegate].mainController;
    
    [UIView animateWithDuration:0.3 animations:^() {
        mainController.beginHereView.alpha = 0.0;
    }];

    
    
    if (mainController.beginHereImgView.isAnimating) {
        [mainController.beginHereImgView stopAnimating];
        mainController.beginHereView.hidden = YES;
    }
    
    
	CGRect btnRect = btnHelp.frame;
	CGRect vwRect = backView.frame;
	
	btnRect.origin.y = 132;
	vwRect.origin.y = 0;
	
    moveAnimation = YES;
    [UIView animateWithDuration:0.7 animations:^{
        btnHelp.frame = btnRect;
        backView.frame = vwRect;
    } completion:^(BOOL finished) {
        moveAnimation = NO;
    }];
    
    isHelpOpen = false;
}

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch=[touches anyObject];
	firstTouch = [touch locationInView:self.view];
    
    NSLog(@"Touched in UIHelpMainViewController");
    UIiJotMainViewController *mainController = [InstaVoiceAppDelegate appDelegate].mainController;
    
    if (!mainController.beginHereView.hidden && mainController.beginHereImgView.isAnimating) {
        [mainController.beginHereImgView stopAnimating];
        mainController.beginHereView.hidden = YES;
    }

    if( mainController.beginHereImgView.tag==[touch view].tag){
        NSLog(@" mainController.beginHereImgView beginHereView Touched");
        [self onClickHelpShowTwo];        
    } else if(btnHelp.tag==[touch view].tag) {
        [self onClickHelpShow];
    }
}
*/



-(void) onClickHelpMore
{
    if (isHelpOpen && [delegate respondsToSelector:@selector(showHelpDetialView)]) {
        [delegate performSelector:@selector(showHelpDetialView)];
        isHelpOpen = false;
    }
}

-(void) onClickHelpClose:(BOOL)animation
{
	CGRect btnRect = btnHelp.frame;
	CGRect vwRect = backView.frame;
	
	btnRect.origin.y = 68;
	vwRect.origin.y = 132;
	
    if (animation && !moveAnimation) {
        moveAnimation = YES;
        [UIView animateWithDuration:0.7 animations:^{
            btnHelp.frame = btnRect;
            backView.frame = vwRect;
        } completion:^(BOOL finished) {
            moveAnimation = NO;
        }];
    }
    else
    {
        btnHelp.frame = btnRect;
        backView.frame = vwRect;
    }
    isHelpOpen = false;
}


//if changed return YES, otherwise NO
-(BOOL)changeHelpInfo:(CGFloat)tl
{
    //remove old help info
    CGFloat oxMoved;
    UIImageView* oicon = [helpArray objectAtIndex:helpIconIndex];
    
    //add new help info
    int totalHelpCount = [helpArray count];
    if (tl>WThreshold) {
        //向右滑动
        helpIconIndex = helpIconIndex-1;
        if (helpIconIndex < 0) {
            helpIconIndex = totalHelpCount - 1;
        }
        oxMoved = backView.frame.size.width;
        
    }
    else if(tl <-WThreshold)
    {
        //向左滑动
        helpIconIndex = (helpIconIndex+1) % totalHelpCount;
        oxMoved = -backView.frame.size.width;
    }
    else
    {
        //移动距离太小，不操作。
        return NO;
    }
    
    UIImageView* icon = [helpArray objectAtIndex:helpIconIndex];

    [backView addSubview:icon];
    CGRect rect = backView.bounds;
    CGRect orect = backView.bounds;
    CGRect nrect = backView.bounds;
    nrect.origin.x = nrect.origin.x - oxMoved;
    orect.origin.x = orect.origin.x + oxMoved;
    icon.frame = nrect;
    moveAnimation = YES;
    [UIView animateWithDuration:0.4 animations:^{
        icon.frame = rect;
        oicon.frame = orect;
    } completion:^(BOOL finished) {
        [oicon removeFromSuperview];
        moveAnimation = NO;
    }];

    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch=[touches anyObject];
	firstTouch = [touch locationInView:self.view];
}
 
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!isHelpOpen) { 
        return;
    }
    if (moveAnimation) {
        return;
    }
    
    UITouch *touch=[touches anyObject];
	CGPoint tpos = [touch locationInView:self.view];
	CGFloat tl = tpos.x - firstTouch.x;
    //只有在touchesended中才判断是否响应按钮事件
    BOOL blflag = [self changeHelpInfo:tl];
    if (blflag == NO) {
        //didn't change the info icon
        CGRect rt = CGRectMake(234,99,72,37);//数据从UIHelpComponentViewController.xib中得到
        CGRect leftArrow = CGRectMake(7, 60, 35, 35);
        CGRect rightArrow = CGRectMake(280, 60, 35, 35);
        
        if (isHelpOpen && YES == CGRectContainsPoint(leftArrow, tpos)) {
            tl = -WThreshold-1;
            [self changeHelpInfo:tl];
        }
        else if (isHelpOpen && YES == CGRectContainsPoint(rightArrow, tpos)) {
            tl = WThreshold+1;
            [self changeHelpInfo:tl];
        }
        else if (isHelpOpen && YES == CGRectContainsPoint(rt, tpos)) {
            [self onClickHelpMore];
        }
        else if (isHelpOpen)
        {
            //invoke onClickHelpDetail
            [self onClickHelpClose:YES];
        }
    }
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
	CGPoint tpos = [touch locationInView:self.view];
	CGFloat tl = tpos.x - firstTouch.x;
    [self changeHelpInfo:tl];
}
@end
