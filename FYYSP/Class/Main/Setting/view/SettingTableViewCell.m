//
//  SettingTableViewCell.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingTableViewCell.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.switch_btn addTarget:self action:@selector(switchBtnValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)switchBtnValueChanged:(id)sender{
    __weak typeof(self) weakSelf = self;
    if (self.delegate&&[self.delegate respondsToSelector:@selector(tableViewCell:didSelectSwitchButtonAtIndexPath:)]) {
        [self.delegate performSelector:@selector(tableViewCell:didSelectSwitchButtonAtIndexPath:) withObject:weakSelf withObject:weakSelf.indexPath];
    }
}



@end
