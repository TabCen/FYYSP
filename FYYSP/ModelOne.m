//
//  ModelOne.m
//  FYYSP
//
//  Created by  chenfei on 16/10/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ModelOne.h"
#import "CFNetworkingManager.h"


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

+(NSURLSessionDataTask *)requestDataWith_ArrayBlock:(void (^)(NSArray *, NSError *))block{
    return [[CFNetworkingManager manager] GET:@"http://api.budejie.com/api/api_open.php?a=list&c=data" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray *array=[ModelOne mj_objectArrayWithKeyValuesArray:(NSArray *)[responseObject valueForKeyPath:@"list"]];
        if (block) {
            block([NSArray arrayWithArray:array],nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block) {
            block([NSArray array], error);
        }
    } showHUD:YES];
}

@end
