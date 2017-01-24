//
//  GlobalSingleton.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "GlobalSingleton.h"



static GlobalSingleton *shareFile = nil;

@implementation GlobalSingleton


+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareFile = [super allocWithZone:zone];
        ///重新设置或者删除初始化得将setting设置为nil放置出现内存泄漏
        shareFile.setting = [[UserSetting alloc]init];
        
    });
    return shareFile;
}

+(instancetype)instence{
    shareFile = [[self alloc] init];
    return shareFile;
}

-(id)copyWithZone:(NSZone *)zone{
    return shareFile;
}

-(void)dealloc{
    
}

#pragma mark - 共享方法

+(NSString *)versionAndBuild{
    return [NSString stringWithFormat:@"%@(%@)",appVersion,appBuild];
}

+(void)resetDefaults{
    
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    
    NSDictionary* dict = [defs dictionaryRepresentation];
    
    for(id key in dict) {
        
        [defs removeObjectForKey:key];
        
    }
    
    [defs synchronize];
}

///这个方法完全可以写到AppDelegate中，逻辑更加清晰，由AppDelegate来判断是否是首次加载，这是它应该做的事，完全可以写一个分类，让这个分类做这样的事情，职责更加清晰
+(void)setUserInformationOnceAfterDo:(void (^)(bool isFirstLoad))block{
    NSString * fistKey = [NSString stringWithFormat:@"FirstLoadVersion_%@",[GlobalSingleton versionAndBuild]];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![[userDefaults objectForKey:fistKey] boolValue]) { //如果是第一次加载
        //将默认删除
        [GlobalSingleton resetDefaults];
        [userDefaults setBool:YES forKey:fistKey];
        [userDefaults synchronize];
        
        //这时需要设置用户设置的默认信息、需要检测用户是否设置了默认信息，如果设置了默认信息则，不对其进行设置，否则需要进行设置
        GlobalSingleton *single = [GlobalSingleton instence];
        
        [single.setting setprimaryDefaultValues];
        //block调用前要先判断block是否存在，存在时调用
        if (block) {
            block(YES);
        }
    }else{
        //如果已经加载了firstkey，则需要判断是否默认设置
        block(NO);
    }
    
}






@end
