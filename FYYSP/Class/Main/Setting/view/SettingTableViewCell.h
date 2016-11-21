//
//  SettingTableViewCell.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *label_tittle;

@property (weak, nonatomic) IBOutlet UILabel *label_introduce;

@property (weak, nonatomic) IBOutlet UISwitch *switch_btn;

@end
