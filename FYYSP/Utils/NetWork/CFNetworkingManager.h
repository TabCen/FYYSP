//
//  CFNetworkingManager.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/14.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

static NSInteger const TIMEOUT = 20;

typedef enum : NSUInteger {
    Type_AFHTTPRequestSerializer = 0,           //二进制
    Type_AFJSONRequestSerializer,               //json格式
} requestSerializerType;

typedef enum : NSUInteger {
    Type_AFJSONResponseSerializer = 0,          //默认返回josn格式
    Type_AFHTTPResponseSerializer,              //二进制
} responseSerializerType;

@interface CFNetworkingManager : NSObject

@property(nonatomic,assign)requestSerializerType   requestSerializer;

@property(nonatomic,assign)responseSerializerType  responseSerializer;

@property(nonatomic,assign)NSInteger                timeoutInterval;


+ (instancetype)manager;

- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                               showHUD:(BOOL)showHUD;

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                showHUD:(BOOL)showHUD;

- (void)cancelRequest;

@end

NS_ASSUME_NONNULL_END
