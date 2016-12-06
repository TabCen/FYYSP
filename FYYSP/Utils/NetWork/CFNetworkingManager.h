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


/**
 带缓存的GET请求

 @param URLString URL
 @param parameters 参数
 @param downloadProgress 进度
 @param success 成功回调函数   //task为nil，从缓存读取的数据;如果task!=nil 从网络请求的数据
 @param failure 失败回调函数
 @param showHUD 是否显示加载框
 @param cacheName 缓存的文件名
 @return 请求的task
 */
- (nullable NSURLSessionDataTask *)GET_cache:(NSString *)URLString
                                  parameters:(nullable id)parameters
                                    progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                                     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                     showHUD:(BOOL)showHUD
                                   cacheFile:(nonnull NSString *)cacheName;

/**
 带缓存的POST请求

 @param URLString URL
 @param parameters 参数
 @param uploadProgress 进度
 @param success 成功回调函数   //task为nil，从缓存读取的数据;如果task!=nil 从网络请求的数据
 @param failure 失败回调函数
 @param showHUD 是否显示加载框
 @param cacheName 缓存的文件名
 @return 请求的task
 */
- (nullable NSURLSessionDataTask *)POST_cache:(NSString *)URLString
                                   parameters:(nullable id)parameters
                                     progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                      success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                      showHUD:(BOOL)showHUD
                                    cacheFile:(nonnull NSString *)cacheName;

- (void)cancelRequest;

@end



@interface NSString (CFNetworkingManager)

- (NSString *)md5String;

+(NSString *)stringFromJsonDict:(NSDictionary *)dic;

@end


NS_ASSUME_NONNULL_END
