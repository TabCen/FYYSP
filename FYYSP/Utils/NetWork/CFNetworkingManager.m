//
//  CFNetworkingManager.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/14.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "CFNetworkingManager.h"
#import "MBProgressHUD.h"
#import "YYCache.h"
#import <CommonCrypto/CommonCrypto.h>

#define currentWindow (UIView*)[[[UIApplication sharedApplication]delegate]window]

#define _kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )

@interface CFNetworkingManager ()

@property(nonatomic,copy)NSString *baseURL_str;

@property(readonly, nonatomic, strong, nullable) NSURL *baseURL;

@property(nonatomic,strong)AFHTTPSessionManager *manage;

@end

@implementation CFNetworkingManager


+ (instancetype)manager{
    return [[self alloc] init];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manage = [[AFHTTPSessionManager alloc]init];
        
        self.manage.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"text/plain",@"application/json", @"text/json", @"text/javascript",@"text/html",@"image/png",@"image/jpeg",@"application/rtf",@"image/gif",@"application/zip",@"audio/x-wav",@"image/tiff",@"application/x-shockwave-flash",@"application/vnd.ms-powerpoint",@"video/mpeg",@"video/quicktime",@"application/x-javascript",@"application/x-gzip",@"application/x-gtar",@"application/msword",@"text/css",@"video/x-msvideo",@"text/xml", nil];
        
        self.timeoutInterval = TIMEOUT;
    }
    return self;
}

- (nullable NSURLSessionDataTask *)GET:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                               showHUD:(BOOL)showHUD{
    if (![self reachable]) {
        NSLog(@"没有网络不需要请求");
        
        return nil;
    }
    
    if (showHUD==YES) {
        [MBProgressHUD showHUDAddedTo:currentWindow animated:YES];
    }
    
    return [self.manage GET:URLString
            parameters:parameters
              progress:parameters
               success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   if (showHUD == YES) {
                       [MBProgressHUD hideHUDForView:currentWindow animated:YES];
                   }
                   
                   if(success){
                       success(task,responseObject);
                   }
               }
               failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   if (showHUD == YES) {
                       [MBProgressHUD hideHUDForView:currentWindow animated:YES];
                   }
                   
                   if (failure) {
                       failure(task,error);
                   }
               }];
    
 }

- (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                showHUD:(BOOL)showHUD{
    
    if (![self reachable]) {
        NSLog(@"没有网络不需要请求");
        
        return nil;
    }
    if (showHUD==YES) {
        [MBProgressHUD showHUDAddedTo:currentWindow animated:YES];
    }
    
    return [self.manage POST:URLString
                  parameters:parameters
                    progress:uploadProgress
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         if (showHUD == YES) {
                             [MBProgressHUD hideHUDForView:currentWindow animated:YES];
                         }
                         if (success) {
                             success(task,responseObject);
                         }
                     }
                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         if (showHUD == YES) {
                             [MBProgressHUD hideHUDForView:currentWindow animated:YES];
                         }
                         
                         if (failure) {
                             failure(task,error);
                         }
                     }];
}

/**
 *start
 * 1.先加载缓存
 * 2.判断有没有网络
 * 3.如果没有网络则return
 * 4.有网，则继续请求，然后刷新内容，刷新缓存
 *end
*/

- (nullable NSURLSessionDataTask *)GET_cache:(NSString *)URLString
                                  parameters:(nullable id)parameters
                                    progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                                     success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                     failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                     showHUD:(BOOL)showHUD
                                   cacheFile:(nonnull NSString *)cacheName{
    NSString *nameStr = [cacheName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (_kStringIsEmpty(nameStr)){
        NSLog(@"缓存文件名不能为空");
        return nil;
    }
    YYCache *cache = [YYCache cacheWithName:nameStr];
    //获取缓存的key————将URL和参数进行拼接
    NSString *keyStr = [self cacheKeyfromURL:URLString andParameters:parameters];
    
    __block id objectFromCache = nil;
    
    if ([cache containsObjectForKey:keyStr]) {
        if(success){
            objectFromCache = [cache objectForKey:keyStr];
            //返回的task为空，所以可以根据这个来判断是否来自缓存
            success(nil,objectFromCache);
        }
    }
    
    if (![self reachable]) {
        NSLog(@"没有网络不需要请求");
        //没有网络的情况下直接取缓存
        return nil;
    }
    
    //返回网络请求会话
    return [self GET:URLString
          parameters:parameters
            progress:downloadProgress
             success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                 //成功后要将缓存数据保存
                 //当objectFromCache不为空，并且，objectFromCache和网络请求的相同时，不需要缓存，否则替换缓存
                 if (!(objectFromCache && [objectFromCache isEqual:responseObject])) {
                     [cache removeObjectForKey:keyStr];
                     [cache setObject:responseObject forKey:keyStr];
                 }
                 
                 //再调用回调函数
                 if (success) {
                     success(task,responseObject);
                 }
             }
             failure:failure
             showHUD:showHUD];
}

- (nullable NSURLSessionDataTask *)POST_cache:(NSString *)URLString
                                   parameters:(nullable id)parameters
                                     progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                      success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
                                      showHUD:(BOOL)showHUD
                                    cacheFile:(nonnull NSString *)cacheName{
    
    NSString *nameStr = [cacheName stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (_kStringIsEmpty(nameStr)){
        NSLog(@"缓存文件名不能为空");
        return nil;
    }
    YYCache *cache = [YYCache cacheWithName:nameStr];
    //获取缓存的key————将URL和参数进行拼接
    NSString *keyStr = [self cacheKeyfromURL:URLString andParameters:parameters];
    
    __block id objectFromCache = nil;
    
    if ([cache containsObjectForKey:keyStr]) {
        if(success){
            objectFromCache = [cache objectForKey:keyStr];
            //返回的task为空，所以可以根据这个来判断是否来自缓存
            success(nil,objectFromCache);
        }
    }
    
    if (![self reachable]) {
        NSLog(@"没有网络不需要请求");
        
        return nil;
    }
    //返回网络请求会话
    return [self POST:URLString
           parameters:parameters
             progress:uploadProgress
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  //成功后要将缓存数据保存
                  //当objectFromCache不为空，并且，objectFromCache和网络请求的相同时，不需要缓存，否则替换缓存
                  if (!(objectFromCache && [objectFromCache isEqual:responseObject])) {
                      [cache removeObjectForKey:keyStr];
                      [cache setObject:responseObject forKey:keyStr];
                  }
                  
                  //再调用回调函数
                  if (success) {
                      success(task,responseObject);
                  }
              }
              failure:failure
              showHUD:showHUD];
    
}



- (void)cancelRequest
{
    [self.manage.operationQueue cancelAllOperations];
}

#pragma mark - 懒加载

-(void)setRequestSerializer:(requestSerializerType)requestSerializer{
    _requestSerializer = requestSerializer;
    //在设置时需要设置manager 的RequestSerializer的样式
    switch (_requestSerializer) {
        case Type_AFJSONRequestSerializer:{
            self.manage.requestSerializer = [AFJSONRequestSerializer serializer];
        }break;
        case Type_AFHTTPRequestSerializer:
        default:{
            self.manage.requestSerializer = [AFHTTPRequestSerializer serializer];
        }break;
    }
}

-(void)setResponseSerializer:(responseSerializerType)responseSerializer{
    _responseSerializer = responseSerializer;
    
    switch (_responseSerializer) {
        case Type_AFHTTPResponseSerializer:{
            self.manage.responseSerializer = [AFHTTPResponseSerializer serializer];
        }break;
        case Type_AFJSONResponseSerializer:
        default:{
            self.manage.responseSerializer = [AFJSONResponseSerializer serializer];
        }break;
    }
}

-(void)setTimeoutInterval:(NSInteger)timeoutInterval{
    _timeoutInterval = timeoutInterval;
    
    self.manage.requestSerializer.timeoutInterval = _timeoutInterval;
}

-(BOOL)reachable{
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

-(NSString *)cacheKeyfromURL:(NSString *)URLString andParameters:(nullable id)parameters{
    NSParameterAssert(URLString);
    
    if (!parameters) {
        return [URLString md5String];
    }
    
    NSString *paramStr = [NSString stringFromJsonDict:parameters];
    return [[NSString stringWithFormat:@"%@%@",URLString,paramStr] md5String];
}

@end



@implementation NSString (CFNetworkingManager)

- (NSString *)md5String {
    const char *str = self.UTF8String;
    unsigned char buffer[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, (CC_LONG)strlen(str), buffer);
    
    return [self stringFromBytes:buffer length:CC_MD5_DIGEST_LENGTH];
}

+(NSString *)stringFromJsonDict:(NSDictionary *)dic
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length {
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < length; i++) {
        [strM appendFormat:@"%02x", bytes[i]];
    }
    
    return [strM copy];
}

@end


