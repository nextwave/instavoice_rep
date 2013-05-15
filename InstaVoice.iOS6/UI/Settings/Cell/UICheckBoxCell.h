//
//  UICheckBoxCell.h
//  iJott
//
//  Created pda.developer@gmail.com on 3/30/11.
//  Copyright 2011 PDAConcepts.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICheckBoxCell : UITableViewCell {

    UILabel *lblText;
    UISwitch *chkValue;
}
@property (nonatomic, retain) IBOutlet UILabel *lblText;
@property (nonatomic, retain) IBOutlet UISwitch *chkValue;

@end
