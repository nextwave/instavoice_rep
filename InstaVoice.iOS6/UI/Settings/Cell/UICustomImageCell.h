//
//  UICustomImageCell.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICustomImageCell : UITableViewCell {
	UIImageView* imgLeftIcon;
	UIImageView* imgBack;
	UIImageView* imgSelected;
	UILabel* lblTitle;
    bool checkSelected;
}
@property (nonatomic, retain) IBOutlet UIImageView* imgSelected;
@property (nonatomic, retain) IBOutlet UIImageView* imgLeftIcon;
@property (nonatomic, retain) IBOutlet UILabel* lblTitle;
@property (nonatomic) bool checkSelected;
-(void) setCustomSelected:(bool)val;
-(void) checkable:(bool)val;

@end
