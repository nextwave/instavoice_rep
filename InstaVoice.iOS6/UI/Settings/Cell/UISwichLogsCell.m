//
//  UISwichLogsCell.m
//  InstaVoice
//
//  Created by IBC Mobile on 5/21/13.
//  Copyright (c) 2013 GenGius. All rights reserved.
//

#import "UISwichLogsCell.h"

@implementation UISwichLogsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_logOnOff release];
    [_logSwich release];
    [super dealloc];
}
- (IBAction)swichValueChange:(id)sender
{
    if(self.logSwich.isOn)
    {
        [SettingsManager sharedManager].logsEnable=YES;
    }
    else
    {
       [SettingsManager sharedManager].logsEnable=NO;
    }
}
@end
