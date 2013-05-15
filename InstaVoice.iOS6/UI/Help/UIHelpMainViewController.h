//
//  UIHelpMainViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIHelpDetailViewController.h"

@interface UIHelpMainViewController : UIViewController {
	NSMutableArray* helpArray;
	UIButton* btnHelp;
	UIView* backView;
	
	id delegate;
    
    CGPoint firstTouch;
    int helpIconIndex;
    
    BOOL moveAnimation;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIButton* btnHelp;
@property (nonatomic, retain) IBOutlet UIView* backView;
@property (retain, nonatomic) IBOutlet UIImageView *help_tags;


-(IBAction) onClickHelpShow;
-(void) onClickHelpClose:(BOOL)animation;
-(void) onClickHelpMore;
-(BOOL)changeHelpInfo:(CGFloat)tl;

-(void) onClickHelpShowTwo;
-(void) customHelpEnable:(bool) val;



@end
