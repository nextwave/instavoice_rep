//
//  UIBottomMenuBarViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBottomMenuBarViewController : UIViewController {
	UIButton* btnSettings;
	UIButton* btnAbout;
	UIButton* btnList;
	UIButton* btnHome;
	UIButton* btnShare;
	id delegate;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIButton* btnSettings;
@property (nonatomic, retain) IBOutlet UIButton* btnAbout;
@property (nonatomic, retain) IBOutlet UIButton* btnList;
@property (nonatomic, retain) IBOutlet UIButton* btnHome;
@property (nonatomic, retain) IBOutlet UIButton* btnShare;
@property (retain, nonatomic) IBOutlet UIImageView *bottomImage;

-(IBAction) onClickSettings:(UIButton*) btn;
-(IBAction) onClickAbout:(UIButton*) btn;
-(IBAction) onClickHome:(UIButton*) btn;
-(IBAction) onClickList:(UIButton*) btn;
-(IBAction) onClickShare:(UIButton*) btn;
- (void) reloadView :(NSString*) lang;
-(void) customEnable:(bool) val;

@end
