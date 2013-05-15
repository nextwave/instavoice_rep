//
//  AddressAnnotation.m
//  Club Finder
//
//  Created by pda.developer@gmail.com on 6/13/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation

@synthesize coordinate;

@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

@end