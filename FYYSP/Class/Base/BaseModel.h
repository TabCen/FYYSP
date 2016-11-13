//
//  BaseModel.h
//  FYYSP
//  Model层进行网络请求
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

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
