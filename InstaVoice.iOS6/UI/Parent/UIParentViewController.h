//
//  UIParentViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIBottomMenuBarViewController.h"

@interface UIParentViewController : UIViewController {
	UIBottomMenuBarViewController* bottomBar;
}
@property (nonatomic,retain) UIBottomMenuBarViewController* bottomBar;
- (BOOL)is4InchRetina;
@end
