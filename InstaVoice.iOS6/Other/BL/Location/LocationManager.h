//
//  LocationManager.h
//  Club Finder
//
//  Created by pda.developer@gmail.ocm on 6/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>{
	CLLocationManager* m_gpsManager;
	double latitude;
	double longitude;
    CLLocation *location;
}

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic,retain) CLLocation *location;
+(LocationManager*) sharedManager;
-(void) startMonitoring;
-(void) stopMonitoring;
@end
