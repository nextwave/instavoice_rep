//
//  UIiJotListCell.m
//  iJott
//
//  Created by pda.developer@gmail.com on 4/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import "UIiJotListCell.h"


@implementation UIiJotListCell
@synthesize lblName;
@synthesize btnPlay;
@synthesize btnShare;

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
	[btnShare release];
	[btnPlay release];
    [lblName release];
    [super dealloc];
}

-(void) flagSelected:(bool) val
{
	if (val)
		[self.btnShare setImage:[UIImage imageNamed:@"flag_check.png"] forState:UIControlStateNormal];
	else 
		[self.btnShare setImage:[UIImage imageNamed:@"flag_uncheck.png"] forState:UIControlStateNormal];
}
@end
