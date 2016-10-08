//
//  NSObject+Model.h
//  FYYSP
//
//  Created by  chenfei on 16/10/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Model)

/**
 *  Model层网络请求返回数组
 *
 *  @param block 回调函数
 *
 *  @return 类似AFN网络请求可以不做接受返回值
 */
+(NSURLSessionDataTask *)requestDataWith_ArrayBlock:(void (^)(NSArray *array,NSError *error))block;

/**
 *  Model层网络请求返回字典
 *
 *  @param block 回调函数
 *
 *  @return 类似AFN网络请求可以不做接受返回值
 */
+(NSURLSessionDataTask *)requestDataWith_DictBlock:(void (^)(NSDictionary *dict,NSError *error))block;

/**
 *  Model层网络请求返回id类型
 *
 *  @param block 回调函数
 *
 *  @return 类似AFN网络请求可以不做接受返回值
 */
+(NSURLSessionDataTask *)requestDataWith_IDBlock:(void (^)(id object,NSError *error))block;



@end
