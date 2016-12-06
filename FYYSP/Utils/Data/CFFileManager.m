//
//  PlistFileManager.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "CFFileManager.h"

@implementation CFFileManager

+(void)createFileInPreferences_FileName:(NSString *)fileName{
//    NSString *path = kPathPreferences;
//    if (!kStringIsEmpty(fileName)) {
//        NSString *file = [path stringByAppendingPathComponent:fileName];
//    }
//    NSFileManager *manage = [NSFileManager defaultManager];
}

+(void)resetDefaults{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSDictionary* dict = [defs dictionaryRepresentation];
    for(id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}


- (long long)fileSizeAtPath:(NSString*)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//遍历文件夹获得文件夹大小，返回多少M
- (CGFloat)folderSizeAtPath:(NSString*)folderPath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    
    long long folderSize = 0;
    
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize/(1024.0*1024.0);
}


@end
