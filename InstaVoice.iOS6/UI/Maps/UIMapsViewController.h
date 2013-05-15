//
//  UIMapsViewController.h
//  iJott
//
//  Created by pda.developer@gmail.com on 6/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define MapRadius 402336
@interface UIMapsViewController : UIViewController {
	MKMapView* customMap;
	NSMutableArray* annotationsArray;
	NSMutableArray* dataArray;
	id delegate;
}

@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) IBOutlet MKMapView* customMap;
-(IBAction) onClickDone;

-(void) setLocations;
-(void) startLocation:(NSString*) query;
-(void) stopLocation;
@property (retain, nonatomic) IBOutlet UIButton *backBtn;

-(void) getLocationData:(NSString*) query;
@end
