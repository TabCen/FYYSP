//
//  SubItemsModel.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EnumHeaderFile.h"

@interface SubItemsModel : NSObject

@property(nonatomic,copy)NSString *tittle;

@property(nonatomic)SettingCellType btnType;

@property(nonatomic,copy)NSString *value;

@end
