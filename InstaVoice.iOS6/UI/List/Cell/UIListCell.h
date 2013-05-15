//
//  UIListCell.h
//  InstaVoice
//
//  Created by whiteagle on 11/07/12.
//  Copyright (c) 2012 GenGius. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIPlayerViewController.h"
#import "UIiJotListViewController.h"

@interface UIListCell : UITableViewCell {
    UIiJotListViewController* list;
    UIButton *btnPlay;
    UIButton *btnFlag;
    UIButton *btnPause;
    
    UIView *viewSelected;
    UIView *viewNormal;
    UILabel *lblTextSelected;
    UILabel *lblTextNormal;
    UIImageView *bgSelectedImage;
    DBJottTable *managedObject;
    BOOL isPlayerPlaying;
}

@property (retain, nonatomic) IBOutlet UIButton *btnPlay;
@property (retain, nonatomic) IBOutlet UIButton *btnFlag;
@property (retain, nonatomic) IBOutlet UIButton *btnPause;

@property (retain, nonatomic) IBOutlet UIView *viewSelected;
@property (retain, nonatomic) IBOutlet UIView *viewNormal;
@property (retain, nonatomic) IBOutlet UILabel *lblTextSelected;
@property (retain, nonatomic) IBOutlet UILabel *lblTextNormal;
@property (retain, nonatomic) IBOutlet UIImageView *bgSelectedImage;
@property (retain, nonatomic) DBJottTable *managedObject;
@property (readwrite, assign) BOOL isEditing;
@property (readwrite, assign) BOOL isExpanded;
@property (readwrite, assign) NSInteger idx;

- (IBAction)clickPlay:(UIButton *)sender;
- (IBAction) flagSelected:(id)sender;
- (void) togglePlayer:(bool) forceHide;
- (void) togglePlaying:(BOOL)expand;
- (void) selectCell:(BOOL)selected animated:(BOOL)animated;
- (void) setDelegatedList:(UIiJotListViewController*) tmp;


@end
