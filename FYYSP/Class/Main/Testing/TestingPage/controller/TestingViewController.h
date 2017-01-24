//
//  TestingViewController.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^TestBlock)(NSString * str);

@interface TestingViewController : BaseViewController


@property(nonatomic,copy)TestBlock block;

@end
