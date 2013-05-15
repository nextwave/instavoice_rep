//
//  UIAboutViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIParentViewController.h"
#import "UIHelpDetailViewController.h"

@interface UIAboutViewController : UIParentViewController {
	UIScrollView* customScroll;
	UIHelpDetailViewController* helpDetailController;
}

@property (nonatomic, retain ) IBOutlet UIScrollView* customScroll;
@property (retain, nonatomic) IBOutlet UIView *beginHereView;
@property (retain, nonatomic) IBOutlet UIImageView *beginHereImgView;
@property (retain, nonatomic) IBOutlet UIImageView *image;
@property (retain, nonatomic) IBOutlet UIImageView *begin_here_image;

@property (retain, nonatomic) IBOutlet UILabel *aboutLabel;
@property (retain, nonatomic) IBOutlet UIButton *helpButton;

-(IBAction) onClickHelp;
-(void)onClickDone;
@end
