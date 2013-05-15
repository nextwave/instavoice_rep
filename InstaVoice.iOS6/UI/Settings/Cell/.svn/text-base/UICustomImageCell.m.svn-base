//
//  UICustomImageCell.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UICustomImageCell.h"


@implementation UICustomImageCell

@synthesize imgLeftIcon;
@synthesize lblTitle;
@synthesize imgSelected;
@synthesize checkSelected;

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
	[imgSelected release];
	[imgLeftIcon release];
	[lblTitle release];
    [super dealloc];
}

#pragma mark Functions

-(void) setCustomSelected:(bool)val
{
    checkSelected = val;
	if (val)
	{
		self.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_selected.png"]] autorelease];
		imgSelected.image = [UIImage imageNamed:@"settings_ok.png"];
		self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_simple.png"]] autorelease];
	}
	else
	{
		self.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_simple.png"]] autorelease];
		imgSelected.image = [UIImage imageNamed:@"settings_not_ok.png"];
		self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_selected.png"]] autorelease];
	}
}

-(void) checkable:(bool)val {
    imgSelected.hidden = !val;
}

@end
