//
//  UIiJotSelectedListCell.h
//  iJott
//
//  Created by pda.developer@gmail.com on 7/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIiJotSelectedListCell : UITableViewCell {
    UILabel *lblName;
	UIButton* btnShare;
	UIButton* btnStop;
}

@property (nonatomic, retain) IBOutlet UIButton* btnStop;
@property (nonatomic, retain) IBOutlet UIButton* btnShare;

@property (nonatomic, retain) IBOutlet UILabel *lblName;
@property (retain, nonatomic) IBOutlet UIImageView *bgView;

-(void) flagSelected:(bool) val;
@end
