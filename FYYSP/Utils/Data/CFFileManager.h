//
//  PlistFileManager.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

/**
    文件管理器
 功能：
    1、创建文件
    2、读取文件
    3、给文件添加内容
    4、删除文件
 */

#import <Foundation/Foundation.h>

@interface CFFileManager : NSObject

+(void)createFileInPreferences_FileName:(NSString *)fileName;

/**
    重制NSUserDefaults
 */
+(void)resetDefaults;

@end
//获取沙盒 目录
//#define kPath  NSHomeDirectory()
//Document             iTunes会同步此文件夹，适合存储重要数据
//#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//Library/Cache        iTunes不会同步此文件夹，适合存储体积大，不需要备份的非重要数据
//#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//Library/Preferences  iTunes会同步此文件夹，适合存储应用的设置信息
//#define kPathPreferences  [NSString stringWithFormat:@"%@/Library/Preference",NSHomeDirectory()]
//tmp                  临时文件，用完就删除
//#define kPathTmp NSTemporaryDirectory()
