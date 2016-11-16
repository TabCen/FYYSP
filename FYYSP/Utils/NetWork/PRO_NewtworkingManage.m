//
//  PRO_NewtworkingManage.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/14.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "PRO_NewtworkingManage.h"

@implementation PRO_NewtworkingManage

static PRO_NewtworkingManage *manage=nil;

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage=[super allocWithZone:zone];
    });
    return manage;
}

+(id)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage=[[self alloc] init];
    });
    return manage;
}

-(id)copy{
    return manage;
}




@end
