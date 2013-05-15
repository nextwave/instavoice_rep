//
//  UIListCell.m
//  InstaVoice
//
//  Created by whiteagle on 11/07/12.
//  Copyright (c) 2012 GenGius. All rights reserved.
//

#import "UIListCell.h"

@implementation UIListCell
@synthesize btnPlay, btnPause, isEditing, isExpanded;
@synthesize btnFlag;
@synthesize viewSelected;
@synthesize viewNormal;
@synthesize lblTextSelected;
@synthesize lblTextNormal;
@synthesize bgSelectedImage;
@synthesize managedObject;
@synthesize idx;

UIPlayerViewController* playerController;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
      //  [bgSelectedImage setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin];
    }
    return self;
}

- (void) setDelegatedList:(UIiJotListViewController*) tmp
{
    
    list = tmp;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
   
    [super setSelected:selected animated:animated];
    if(list.currentSelected!=self.idx) {
        [self selectCell:selected animated:animated];
    }
}

- (void) selectCell:(BOOL)selected animated:(BOOL)animated
{
    viewSelected.hidden = !selected;
    if(animated==YES) {
        float alpha = selected ? 0.0 : 1.0;
        float target = selected ? 1.0 : 0.0;
        [viewSelected setAlpha:alpha];
        [UIView animateWithDuration:0.05 animations:^(void){
            [viewSelected setAlpha:target];
        } completion:nil];
    } else {
        float target = selected ? 1.0 : 0.0;
        [viewSelected setAlpha:target];
    }
}

-(void) togglePlaying:(BOOL)expand
{
    isPlayerPlaying=expand;
    if (playerController == nil) {
		playerController = [[UIPlayerViewController alloc] initWithNibName:@"UIPlayerViewController" bundle:[NSBundle mainBundle]];
        playerController.view.hidden = NO;
    }
    
    //bool isHidden = !self.isExpanded;
    if(expand) {
        UIView* v = playerController.view;
        [v removeFromSuperview];
        CGRect frame = v.bounds;
        v.frame = CGRectMake(0, self.bgSelectedImage.bounds.size.height, frame.size.width, frame.size.height);
        [v setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin];
        v.hidden = NO;
        [self.viewSelected insertSubview:v belowSubview:self.bgSelectedImage];
        self.isExpanded = YES;
        //list.currentSelected = self.idx;
        btnPlay.hidden = YES;
        btnPause.hidden = NO;
        
 //by EKBPGK Ticket #2
        playerController.delegate=list;
        playerController.managedObject=self.managedObject;
        // 
        
        [playerController startPlay];
        [self selectCell:YES animated:YES];
    } else {
        [playerController stopPlay];
        //list.currentSelected = -1;
        btnPlay.hidden = NO;
        btnPause.hidden = YES;
        self.isExpanded = NO;
        [self selectCell:NO animated:YES];
    }

    //[self togglePlayer:false];
}

- (IBAction)clickPlay:(UIButton *)sender {
    [list onClickPlay:self];
    //[self togglePlaying];
}

-(void) togglePlayer:(bool) forceHide
{
    bool hide = forceHide;

    bool isHidden = !self.isExpanded;
    float alpha = isHidden ? 0.0 : 1.0;
    float target = isHidden ? 1.0 : 0.0;
    
    if(forceHide || !isHidden) {
        hide = true;
        list.currentSelected = -1;
        self.isExpanded = NO;
    } else {
        list.currentSelected = self.idx;
        self.isExpanded = YES;
    }
    [viewSelected setAlpha:alpha];
    if(hide) {
        [playerController stopPlay];
        [UIView animateWithDuration:0.4 animations:^{
            btnPlay.alpha = 1.0;
            btnPause.alpha = 0.0;
            [viewSelected setAlpha:target];
        } completion:^(BOOL finished){
            [playerController resetButtons];
        }];
    } else {
        [playerController setManagedObject:self.managedObject];
        [UIView animateWithDuration:0.2 animations:^{
            [viewSelected setAlpha:target];
            btnPlay.alpha = 0.0;
            btnPause.alpha = 0.8;
        } completion:^(BOOL finished){
            [playerController startPlay];
        }];
    }
}



- (void)dealloc {
    [btnPlay release];
    [viewSelected release];
    [viewNormal release];
    [lblTextSelected release];
    [lblTextNormal release];
    [btnFlag release];
    [bgSelectedImage release];
    //[playerController release];
    [btnPause release];
    //[list release];
    [super dealloc];
}

- (IBAction) flagSelected:(id)sender
{
    int val = [self.managedObject.flag intValue];
    if(sender) {
        if(isPlayerPlaying)//playing
        {
            val=1;
        }
        self.managedObject.flag=[NSNumber numberWithInt:!val];
        DBManager* manager = [DBManager sharedManager];
        [manager saveContext];
        val = [self.managedObject.flag intValue];
    }
	if (val==1) {
		[self.btnFlag setImage:[UIImage imageNamed:@"flag_check.png"] forState:UIControlStateNormal];
	} else {
		[self.btnFlag setImage:[UIImage imageNamed:@"flag_uncheck.png"] forState:UIControlStateNormal];
    }
}

@end
