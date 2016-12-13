//
//  ImageURLModel.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/9.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ImageURLModel.h"
#import "MJExtension.h"

@implementation ImageURLModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"idNum" : @"id",
             };
}

+(NSURLSessionDataTask *)requestDataWith_ArrayBlock:(void (^)(NSArray *array,NSError *error))block{
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    params[@"pageSize"] = @"10";
    params[@"curPage"] = @"1";
    
    return [[CFNetworkingManager manager]GET:ImageURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        __block NSArray *temArray = [[NSArray alloc]initWithArray:[ImageURLModel mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"list"]]];
        
        if (block) {
            block(temArray,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block(nil,error);
        }
    } showHUD:NO];
}

@end
