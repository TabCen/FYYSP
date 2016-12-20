//
//  UserSetting.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/13.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const SETTING_LeaderOpen = @"setting_leaderOpen";
static NSString * const SETTING_selfDefineTabBar = @"setting_selfDefineTabBar";
static NSString * const SETTING_adViewOpen = @"setting_adViewOpen";
static NSString * const SETTING_drawerViewOpen = @"setting_drawerViewOpen";

@interface UserSetting : NSObject

@property(nonatomic,assign)BOOL leaderOpen;

@property(nonatomic,assign)BOOL selfDefineTabBar;

@property(nonatomic,assign)BOOL adViewOpen;

@property(nonatomic,assign)BOOL drawerViewOpen;

-(instancetype)initWithDefaultValue;

-(void)setprimaryDefaultValues;

/**
 第一次加载时设置默认信息

 @return 返回是否设置了
 */
+(BOOL)firstLoadSetting;

@end
