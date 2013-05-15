//
//  UICustomProgressBarWifiViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 10/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICustomProgressBarWifiViewController : UIViewController {
	UIView* customButtonView;
	NSMutableArray* buttonsArray;
	NSTimer* customTimer;
	int index;
}
@property (nonatomic, retain) IBOutlet UIView* customButtonView;

-(void) updateCounter;
-(void) startCounter;
-(void) resetCounter;

@end
