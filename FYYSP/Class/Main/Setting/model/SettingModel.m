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
                               ]}
                     ];
    
    return [NSMutableArray arrayWithArray:arr];
}

@end
