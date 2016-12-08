//
//  UITableView+CommonFunction.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/6.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UITableView+CommonFunction.h"

#import "SettingTableViewCell.h"

#import "SettingArrowTableViewCell.h"

#import "SettingModel.h"

#import "SubItemsModel.h"

static NSString * const ID_Setting = @"Setting_Cell_ID";
static NSString * const ID_SettingArrow = @"Setting_Cell_Arrow_ID";


@implementation UITableView (CommonFunction)


-(UITableViewCell *)cellAtIndexPath:(NSIndexPath *)indexPath withObject:(id)obj andOwner:(id)owner{
    SettingModel *model = (SettingModel *)obj;
//    if (indexPath.section == 0) {
//        if (indexPath.row == 0) {
            switch (model.btnType) {
                case SettingCellType_Choose:{
                    return [self settingArrowTableViewCellAtIndexPath:indexPath withObject:obj andOwner:owner];
                }break;
                case SettingCellType_Switch:{
                    return [self settingTableViewCellAtIndexPath:indexPath withObject:obj andOwner:owner];
                }break;
                default:
                    break;
            }
            
//            SettingTableViewCell *cell = [self dequeueReusableCellWithIdentifier:ID_Setting forIndexPath:indexPath];
//            cell.label_tittle.text = [NSString stringWithFormat:@"%@",model.tittle];
//            cell.label_introduce.text = [NSString stringWithFormat:@"%@",model.introduce];
//            cell.delegate = owner;
//            cell.indexPath = indexPath;
//            return cell;
//            
//        }else if (indexPath.row ==1){
//            
//            SubItemsModel *subModel = (SubItemsModel*)[model.subItems objectAtIndex:0];
//            SettingArrowTableViewCell *cell = [self dequeueReusableCellWithIdentifier:ID_SettingArrow forIndexPath:indexPath];
//            cell.label_tittle.text = [NSString stringWithFormat:@"%@",subModel.tittle];
//            cell.textField_introduce.text = [NSString stringWithFormat:@"%@",subModel.value];
//            return cell;
    
//        }
//    }
    SettingTableViewCell *cell = [self dequeueReusableCellWithIdentifier:ID_Setting forIndexPath:indexPath];
    cell.label_tittle.text = [NSString stringWithFormat:@"%@",model.tittle];
    cell.label_introduce.text = [NSString stringWithFormat:@"%@",model.introduce];
    cell.delegate = owner;
    cell.indexPath = indexPath;
    return cell;
    
}

-(SettingTableViewCell *)settingTableViewCellAtIndexPath:(NSIndexPath *)indexPath withObject:(id)obj andOwner:(id)owner{
    SettingModel *model = (SettingModel *)obj;
    SettingTableViewCell *cell = [self dequeueReusableCellWithIdentifier:ID_Setting forIndexPath:indexPath];
    cell.label_tittle.text = [NSString stringWithFormat:@"%@",model.tittle];
    cell.label_introduce.text = [NSString stringWithFormat:@"%@",model.introduce];
    cell.delegate = owner;
    cell.indexPath = indexPath;
    
    return cell;
}

-(SettingArrowTableViewCell *)settingArrowTableViewCellAtIndexPath:(NSIndexPath *)indexPath withObject:(id)obj andOwner:(id)owner{
    SettingModel *model = (SettingModel *)obj;
    SubItemsModel *subModel = (SubItemsModel*)[model.subItems objectAtIndex:0];
    SettingArrowTableViewCell *cell = [self dequeueReusableCellWithIdentifier:ID_SettingArrow forIndexPath:indexPath];
    cell.label_tittle.text = [NSString stringWithFormat:@"%@",subModel.tittle];
    cell.textField_introduce.text = [NSString stringWithFormat:@"%@",subModel.value];
    return cell;
    
}





@end
