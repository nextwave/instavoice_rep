//
//  UIWiFiShareViewController.h
//  iJott
//
//  Created pda.developer@gmail.com on 3/27/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyHTTPServer.h"
#import "UICustomProgressBarWifiViewController.h"

@interface UIWiFiShareViewController : UIViewController {
    MyHTTPServer *httpServer;
	bool isStarted;
	UIButton* btnStart;
	UILabel* lblIpPort;
	UILabel* txtView;
	
	UICustomProgressBarWifiViewController* customProgress;
	UIImageView* imgCreating;
    NSTimer *progressTimmer;
    float progressValue;
     UIColor* _progressTintColor;
     UIColor* _progressTintColorDark;
}

@property (nonatomic, retain) IBOutlet UIImageView* imgCreating;
@property (nonatomic, retain) UICustomProgressBarWifiViewController* customProgress;

@property (nonatomic, retain) IBOutlet UILabel* lblIpPort;
@property (nonatomic, retain) IBOutlet UILabel* txtView;
@property (retain, nonatomic) IBOutlet UIImageView *imgReady;
@property (nonatomic, retain) IBOutlet UIButton* btnStart;

@property (retain, nonatomic) IBOutlet UIImageView *wifiShare;
@property (retain, nonatomic) IBOutlet UIImageView *please_direct;
@property (retain, nonatomic) IBOutlet UIImageView *creating;
@property (retain, nonatomic) IBOutlet UILabel *labelShare;
@property (retain, nonatomic) IBOutlet UIButton *doneBtn;
//@property (retain, nonatomic) IBOutlet UIProgressView *progressController;
@property (retain, nonatomic) NSTimer *progressTimmer;

-(void) onClickStart;
-(IBAction)onClickStop;
-(void) updateIpList;

- (NSString*) getIPArray;
- (NSString*) getFirstIP;

-(void) prepareIndexPage;
-(void) createArchive;
-(void) removeArchive;
-(void) hideProgress;

@end
