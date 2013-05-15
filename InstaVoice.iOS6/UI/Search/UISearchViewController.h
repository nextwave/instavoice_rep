//
//  UISearchViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UISearchViewController : UIViewController {
	UIWebView* customWeb;
	UIView* loadingView;
	id delegate;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) IBOutlet UIWebView* customWeb;
@property (nonatomic, retain) IBOutlet UIView* loadingView;
-(IBAction) onClickDone;
-(IBAction) onClickNext;
-(IBAction) onClickPrevious;

@property (retain, nonatomic) IBOutlet UIButton *backBtn;
-(void) loadWebPage:(NSString*) str;
@end
