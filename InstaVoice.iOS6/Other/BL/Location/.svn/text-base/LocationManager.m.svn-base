//
//  LocationManager.m
//  Club Finder
//
//  Created by pda.developer@gmail.ocm on 6/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "LocationManager.h"
#import "NSNotificationAdditions.h"

@implementation LocationManager
@synthesize latitude;
@synthesize longitude;
@synthesize location;

static LocationManager* _manager;
+(LocationManager*) sharedManager
{
	if (_manager == nil)
	{
		_manager = [[LocationManager alloc] init];
		_manager.latitude = -1;
		_manager.longitude = -1;
	}
	
	return _manager;
}

-(id) init
{
	if (self = [super init])
	{
	}
	return self;
}

-(void) dealloc
{
	[m_gpsManager release];
	[super dealloc];
}

#pragma mark Functions
-(void) startMonitoring
{
	DLog(@"Starting monitor");
	if (m_gpsManager == nil)
	{
		m_gpsManager = [[CLLocationManager alloc] init];
		m_gpsManager.delegate = self;
	}
	
	DLog(@"Starting monitor");
	[m_gpsManager startUpdatingLocation];
}

-(void) stopMonitoring
{
	DLog(@"Stop monitoring");
	if (m_gpsManager)
	{
		[m_gpsManager stopUpdatingLocation];
		[m_gpsManager release];
		m_gpsManager = nil;
	}
}

#pragma mark -
#pragma mark Delegates
#pragma mark -

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	DLog(@"Error = %@", [error description]);
}


- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	DLog(@"location manager ----------------------");
	if (signbit(newLocation.horizontalAccuracy)) 
	{
		DLog(@"horizontal accuracy signbit");
	} 
	else
	{
        self.location = newLocation;
		self.latitude = newLocation.coordinate.latitude;
		self.longitude = newLocation.coordinate.longitude;
		DLog(@"updating location = %lf, %lf", self.latitude, self.longitude);
		[[NSNotificationCenter defaultCenter] postNotificationOnMainThreadWithName:@"LocationChange" object:nil];
	}
}
@end
