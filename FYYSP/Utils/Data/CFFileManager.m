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
    NSString *path = kPathPreferences;
    
    if (!kStringIsEmpty(fileName)) {
        NSString *file = [path stringByAppendingPathComponent:fileName];
    }
    
//    NSFileManager *manage = [NSFileManager defaultManager];
    

}

@end