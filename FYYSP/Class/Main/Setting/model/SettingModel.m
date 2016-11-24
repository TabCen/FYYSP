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


+(NSMutableArray *)settingModelArray{
    NSArray *arr = @[@{@"tittle":@"引导页开启",
                       @"introduce":@"开启后，重新进入应用可看到引导页",
                       @"btnType":@"switch",
                       @"value":@NO,
                       @"subItems":@[
                               @{@"tittle":@"样式",
                                 @"btnType":@"choose",
                                 @"value":@"图片轮播",
                                   },
                               ]},
                     @{@"tittle":@"TabBar中间按钮",
                       @"introduce":@"自定义了TabBar",
                       @"btnType":@"switch",
                       @"value":@NO,
                       @"subItems":@[
                               ]},
                     @{@"tittle":@"广告页",
                       @"introduce":@"开启后闪屏后先进入广告页",
                       @"btnType":@"switch",
                       @"value":@NO,
                       @"subItems":@[
                               ]},
                     @{@"tittle":@"左边栏抽屉架构",
                       @"introduce":@"开启后菜单栏隐藏于左边抽屉，侧滑呼出",
                       @"btnType":@"switch",
                       @"value":@NO,
                       @"subItems":@[
                               ]}
                     ];
    
    return [NSMutableArray arrayWithArray:arr];
}

@end
