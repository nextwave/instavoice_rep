//
//  UICustomDetailCell.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICustomDetailCell : UITableViewCell {
	UILabel* lblText;
	UILabel* lblDescr;
	UIImageView* imgButton;
}

@property (nonatomic, retain) IBOutlet UIImageView* imgButton;
@property (nonatomic, retain) IBOutlet UILabel* lblText;
@property (nonatomic, retain) IBOutlet UILabel* lblDescr;
@property (retain, nonatomic) IBOutlet UISwitch *logSwich;

-(void) hideButton;
- (IBAction)swichValueChange:(id)sender;

@end
