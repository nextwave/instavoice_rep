//
//  UICustomProgressBarViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICustomProgressBarViewController : UIViewController {
	UIView* customButtonView;
	NSMutableArray* buttonsArray;
	NSTimer* customTimer;
	int index;
	UIImageView* imgBackground;
}
@property (nonatomic, retain) IBOutlet UIImageView* imgBackground;

@property (nonatomic, retain) IBOutlet UIView* customButtonView;

-(void) updateCounter;
-(void) startCounter;
-(void) resetCounter;
@end
