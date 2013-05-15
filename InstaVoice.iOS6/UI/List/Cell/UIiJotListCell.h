//
//  UIiJotListCell.h
//  iJott
//
//  Created by pda.developer@gmail.com on 4/2/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIiJotListCell : UITableViewCell {

    UILabel *lblName;
	UIButton* btnPlay;
	UIButton* btnShare;
}
@property (nonatomic, retain) IBOutlet UIButton* btnPlay;
@property (nonatomic, retain) IBOutlet UIButton* btnShare;
@property (nonatomic, retain) IBOutlet UILabel *lblName;

-(void) flagSelected:(bool) val;
@end
