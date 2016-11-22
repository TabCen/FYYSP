//
//  GlobalSingleton.h
//  FYYSP
//  单例，存储重要的数据
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalSingleton : NSObject

+(instancetype)instence;

///获取版本号和build号
-(NSString *)versionAndBuild;

@end
