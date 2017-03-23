//
//  GlobalSingleton.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "GlobalSingleton.h"

NSString *const OlderVersionBulid = @"OlderVersionBulid";

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
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //获取版本唯一版本号
    NSString * versionAndBulid = [NSString stringWithFormat:@"Version&Bulid_%@_%@",appVersion,appBuild];
    NSLog(@"%@",versionAndBulid);
    if (![[userDefaults objectForKey:versionAndBulid] boolValue]) { //如果是第一次加载
        //删除老版本的信息存储，保存新版本的存储
        NSString *temVB = [userDefaults objectForKey:OlderVersionBulid];
        if (!kStringIsEmpty(temVB)) {
            [userDefaults removeObjectForKey:temVB];
            [userDefaults synchronize];
        }
        //版本更新后需要将新版本改成YES表示已经第一次加载过，并且设置oldVersion
        [userDefaults setBool:YES forKey:versionAndBulid];
        [userDefaults setObject:versionAndBulid forKey:OlderVersionBulid];
        [userDefaults synchronize];
        
        if (block) {
            block(YES);
        }
    }else{
        if (block) {
            block(NO);
        }
    }
}






@end
