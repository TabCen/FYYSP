//
//  SettingTableViewCell.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CFTableViewCellDelegate.h"

@interface SettingTableViewCell : UITableViewCell

@property (strong, nonatomic)NSIndexPath       *indexPath;

@property (weak, nonatomic) id <CFTableViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *label_tittle;

@property (weak, nonatomic) IBOutlet UILabel *label_introduce;

@property (weak, nonatomic) IBOutlet UISwitch *switch_btn;

@end
