//
//  ModelOne.m
//  FYYSP
//
//  Created by  chenfei on 16/10/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ModelOne.h"


@implementation ModelOne

- (instancetype)initWithAttribute:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.text=[NSString stringWithFormat:@"%@",[dict valueForKeyPath:@"text"]];
        self.name=[NSString stringWithFormat:@"%@",[dict valueForKeyPath:@"name"]];
        self.screen_name=[NSString stringWithFormat:@"%@",[dict valueForKeyPath:@"screen_name"]];
        self.text=[NSString stringWithFormat:@"%@",[dict valueForKeyPath:@"image0"]];
    }
    return self;
}

//+(NSURLSessionDataTask *)requestDataWith_IDBlock:(void (^)(id, NSError *))block{
//    AFHTTPSessionManager *manage=[[AFHTTPSessionManager alloc]init];
//    
//    NSDictionary *dict=@{
//                         @"a":@"list",
//                         @"c":@"data"
//                         };
//    
//    return [manage POST:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSInteger num=((NSArray *)[responseObject valueForKey:@"list"]).count;
//        
//        NSMutableArray *array=[NSMutableArray arrayWithCapacity:num];
//        
//        for (int i=0; i<num; i++) {
//            NSDictionary *dict=[(NSArray *)[responseObject valueForKey:@"list"] objectAtIndex:i];
//            ModelOne *model = [[ModelOne alloc]initWithAttribute:dict];
//            [array addObject:model];
//            
//        }
//        block(array,nil);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        block(nil,error);
//    }];
//}

+(NSURLSessionDataTask *)requestDataWith_ArrayBlock:(void (^)(NSArray *, NSError *))block{
    AFHTTPSessionManager *manage=[[AFHTTPSessionManager alloc]init];
    
    NSDictionary *dict=@{
                         @"a":@"list",
                         @"c":@"data"
                         };
    
    return [manage POST:@"http://api.budejie.com/api/api_open.php" parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *array=[ModelOne mj_objectArrayWithKeyValuesArray:(NSArray *)[responseObject valueForKeyPath:@"list"]];
        
        block(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(nil,error);
    }];
}

@end
