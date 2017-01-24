//
//  Model_Fund.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/6.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "Model_Fund.h"

#import "UFO.h"

@implementation Model_Fund

+(NSURLSessionDataTask *)requestDataWith_IDBlock:(void (^)(id object,NSError *error))block{
    //    NSString *timeStamp = [UFO timeStamp];
    NSDictionary *dict=@{
                         @"fund['currentpage']":@"1",
                         @"fund['pagesize']":@"30",
                         @"fund['newstype']":@"1",
                         @"fund['function']":@"N003",
                         @"fund['fundchannel']":@"ios",
                         //                         @"fund['timestamp']":[NSString stringWithFormat:@"%@|%@",timeStamp,[[NSString stringWithFormat:@"%@%@%@",@"@newtouch!",timeStamp,@"@newtouch!"] md5String]] //时间戳(N)
                         };
    
    //不带缓存的网络请求
    return [[CFNetworkingManager manager]GET:FCL_URL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id     _Nullable responseObject) {
        if (block) {
            block(responseObject,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
        }
    } showHUD:YES];
    
    //带缓存的网络请求
//    return [[CFNetworkingManager manager] GET_cache:FCL_URL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (task) {
//            //网络请求得来的数据
//            if (block) {
//                block(responseObject,nil);
//            }
//        }else{
//            //缓存的来的数据
//            if (block) {
//                block(responseObject,nil);
//            }
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (block) {
//            block(nil,error);
//        }
//    } showHUD:YES cacheFile:@"MYCFITEM.FYYSP.MineFile"];
}

@end
