//
//  WFTableViewCell.m
//  IT资讯
//
//  Created by qingyun on 16/1/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "WFTableViewCell.h"
#import "WFModel.h"
@interface WFTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *manCountLabel;

@end

@implementation WFTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(WFModel *)model{
    _model = model;
    _imgView.image = [UIImage imageNamed:model.icon];
    _titleLabel.text = model.title;
    _timeLabel.text = model.time;
    _manCountLabel.text = model.mancount;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
