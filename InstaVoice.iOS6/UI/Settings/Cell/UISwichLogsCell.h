//
//  UISwichLogsCell.h
//  InstaVoice
//
//  Created by IBC Mobile on 5/21/13.
//  Copyright (c) 2013 GenGius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsManager.h"

@interface UISwichLogsCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *logOnOff;
@property (retain, nonatomic) IBOutlet UISwitch *logSwich;

- (IBAction)swichValueChange:(id)sender;
@end
