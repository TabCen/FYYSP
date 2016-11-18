//
//  CFNetworkingManager.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/14.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "CFNetworkingManager.h"
#import "MBProgressHUD.h"

#define currentWindow (UIView*)[[[UIApplication sharedApplication]delegate]window]

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


@end
