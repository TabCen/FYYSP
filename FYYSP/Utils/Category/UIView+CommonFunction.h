//
//  UIView+CommonFunction.h
//  FYYSP
//
//  Created by FBI01 on 17/1/23.
//  Copyright © 2017年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CommonFunction)


/**
 所有父视图

 @return 父视图数组
 */
-(NSArray *)superViews;


+(UIView *)commonView:(UIView *)view1 andView:(UIView *)view2;


@end
