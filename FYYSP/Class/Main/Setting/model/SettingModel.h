//
//  SettingModel.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "NSObject+MJKeyValue.h"

#import "EnumHeaderFile.h"

@interface SettingModel : NSObject

@property(nonatomic,copy)NSString *tittle;

@property(nonatomic,copy)NSString *introduce;

@property(nonatomic)SettingCellType btnType;

@property(nonatomic)BOOL value;

@property(nonatomic,strong)NSMutableArray *subItems;

+(NSMutableArray *)settingModelArray;

@end


//FOUNDATION_EXPORT CFSetingCellType const SettingCellType_Choose;
//FOUNDATION_EXPORT CFSetingCellType const SettingCellType_Choose;


//@"tittle":@"引导页开启",
//@"introduce":@"开启后，重新进入应用可看到引导页",
//@"btnType":@"switch",
//@"value":@NO,
//@"subItems":@[
//              
//              ]}
