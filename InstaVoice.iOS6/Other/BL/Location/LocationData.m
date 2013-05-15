//
//  LocationData.m
//  
//
//  Created by pda.developer@gmail.com on 6/12/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "LocationData.h"


@implementation LocationData
@synthesize locationName;
@synthesize locationAddress;
@synthesize latitude;
@synthesize longitude;
@synthesize imgName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
