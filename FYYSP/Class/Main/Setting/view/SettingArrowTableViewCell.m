//
//  SettingArrowTableViewCell.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/23.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingArrowTableViewCell.h"

@implementation SettingArrowTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.separatorInset = UIEdgeInsetsMake(0,15,0,0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
