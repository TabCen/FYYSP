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

@end
