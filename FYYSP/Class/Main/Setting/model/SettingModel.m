//
//  SettingModel.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SettingModel.h"


@implementation SettingModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"subItems" : @"SubItemsModel"
             };
}


//应该讲这个数据放到数据库中，每次修改都修改数据库，刷新数据时根据数据库的来修改，初次修改时根据这里来设置数据库内容
+(NSMutableArray *)settingModelArray{
    NSArray *arr = @[@{@"tittle":@"引导页开启",
                       @"introduce":@"开启后，重新进入应用可看到引导页",
                       @"btnType":@(SettingCellType_Switch),
                       @"value":@NO,
                       @"subItems":@[
                               @{@"tittle":@"样式",
                                 @"btnType":@(SettingCellType_Choose),
                                 @"value":@"图片轮播",
                                   },
                               ]}
//                     ,
//                     @{@"tittle":@"TabBar中间按钮",
//                       @"introduce":@"自定义了TabBar",
//                       @"btnType":@(SettingCellType_Switch),
//                       @"value":@NO,
//                       @"subItems":@[
//                               ]},
//                     @{@"tittle":@"广告页",
//                       @"introduce":@"开启后闪屏后先进入广告页",
//                       @"btnType":@(SettingCellType_Switch),
//                       @"value":@NO,
//                       @"subItems":@[
//                               ]},
//                     @{@"tittle":@"左边栏抽屉架构",
//                       @"introduce":@"开启后菜单栏隐藏于左边抽屉，侧滑呼出",
//                       @"btnType":@(SettingCellType_Switch),
//                       @"value":@NO,
//                       @"subItems":@[
//                               ]}
//                     @{@"tittle":@"清空缓存",
//                       @"introduce":@"",
//                       @"btnType":@"",
//                       @"value":@NO,
//                       @"subItems":@[
//                               ]}
                     ];
    
    return [NSMutableArray arrayWithArray:arr];
}


@end
