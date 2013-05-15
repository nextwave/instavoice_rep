//
//  UIiJotSelectedListCell.m
//  iJott
//
//  Created by pda.developer@gmail.com on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIiJotSelectedListCell.h"


@implementation UIiJotSelectedListCell
@synthesize lblName;
@synthesize bgView;
@synthesize btnShare;
@synthesize btnStop;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
			// Initialization code.
        
        
        
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    /*
    [UIView animateWithDuration:0.7 animations:^{
        [self setAlpha:1.0];
    }];
     */
		// Configure the view for the selected state.
}




- (void)dealloc {
	[btnStop release];
	[btnShare release];
    [lblName release];
    [bgView release];
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
