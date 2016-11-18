//
//  BaseModel.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+(NSURLSessionDataTask *)requestDataWith_ArrayBlock:(void (^)(NSArray *array,NSError *error))block{
    NSLog(@"警告:%@ 模型未设置请求",NSStringFromClass([self class]));
    return nil;
}

+(NSURLSessionDataTask *)requestDataWith_DictBlock:(void (^)(NSDictionary *dict,NSError *error))block{
    NSLog(@"警告:%@ 模型未设置请求",NSStringFromClass([self class]));
    return nil;
}

+(NSURLSessionDataTask *)requestDataWith_IDBlock:(void (^)(id object,NSError *error))block{
    NSLog(@"警告:%@ 模型未设置请求",NSStringFromClass([self class]));
    return nil;
}

@end
