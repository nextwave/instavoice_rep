//
//  UIShareCell.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIShareCell.h"


@implementation UIShareCell
@synthesize lblText;
@synthesize imgIcon;

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
	[imgIcon release];
	[lblText release];
	
    [super dealloc];
}

-(void) setCustomSelected:(bool)val
{
	if (val)
	{
		
		self.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_selected.png"]] autorelease];
		self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_simple.png"]] autorelease];
	}
	else
	{
		self.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_simple.png"]] autorelease];
		self.selectedBackgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_selected.png"]] autorelease];
	}
}
@end
