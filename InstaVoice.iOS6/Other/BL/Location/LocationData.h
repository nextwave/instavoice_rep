//
//  ClubData.h
//  
//
//  Created by pda.developer@gmail.com on 6/12/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LocationData : UITableViewCell {
	NSString* locationName;
	NSString* locationAddress;
	NSString* imgName;
	double latitude;
	double longitude;
	
}

@property (nonatomic, copy) NSString* imgName;
@property (nonatomic, copy) NSString* locationName;
@property (nonatomic, copy) NSString* locationAddress;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@end
