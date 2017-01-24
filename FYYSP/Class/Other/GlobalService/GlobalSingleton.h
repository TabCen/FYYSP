//
//  GlobalSingleton.h
//  FYYSP
//  单例，存储重要的数据
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserSetting.h"


@interface GlobalSingleton : NSObject

@property(nonatomic,strong)UserSetting *setting;


+(instancetype)instence;




///获取版本号和build号
+(NSString *)versionAndBuild;

/**
    重制存放在NSUserDefaults的数据，数据和单例是隔离的，所以不必要担心单例里面数据需要删除
 */
+(void)resetDefaults;

/**
 设置默认用户信息

 @param block 设置完成回调block
 */
+(void)setUserInformationOnceAfterDo:(void (^)(bool isFirstLoad))block;

@end
