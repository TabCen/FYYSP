//
//  PlistFileManager.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "CFFileManager.h"

@implementation CFFileManager



+(void)createFileInPreferences_FileName:(NSString * _Nonnull )fileName{
    //如果fileName为空或者为nil直接返回，并且提示不能为空
    NSAssert(!kStringIsEmpty(fileName), @"创建的文件名不能为空 !!--> [CFFileManager createFileInPreferences_FileName:]");
    
    NSString *path = kPathPreferences;
    NSString *file = [path stringByAppendingPathComponent:@"text.txt"];
    NSFileManager *manage = [NSFileManager defaultManager];
    
    NSLog(@"filepath : %@",file);
    
    if ([manage createFileAtPath:file contents:nil attributes:nil]) {
        NSLog(@"创建成功 >file");
    }else{
        NSLog(@"创建失败");
    }
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
