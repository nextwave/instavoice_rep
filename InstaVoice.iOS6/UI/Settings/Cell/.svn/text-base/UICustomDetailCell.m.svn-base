//
//  UICustomDetailCell.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICustomDetailCell.h"


@implementation UICustomDetailCell

@synthesize lblText;
@synthesize lblDescr;
@synthesize imgButton;


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
	[imgButton release];
	[lblText release];
	[lblDescr release];
    [super dealloc];
}

-(void) hideButton
{
	imgButton.hidden = true;
}
@end
