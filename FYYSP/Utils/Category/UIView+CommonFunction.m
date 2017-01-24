//
//  UIView+CommonFunction.m
//  FYYSP
//
//  Created by FBI01 on 17/1/23.
//  Copyright © 2017年 chenfei. All rights reserved.
//

#import "UIView+CommonFunction.h"

@implementation UIView (CommonFunction)

-(NSArray *)superViews{
    UIView *view = self;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];

    while (view!=nil) {
        [array addObject:view];
        view = view.superview;
    }

    return [array copy];
}

+(UIView *)commonView:(UIView *)view1 andView:(UIView *)view2{

    NSArray *array1 = [view1 superViews];

    NSArray *array2 = [view2 superViews];

    NSSet *set = [NSSet setWithArray:array1];

    for (int i =0; i<array2.count; i++) {
        UIView *targetView = array2[i];
        if ([set containsObject:targetView]) {
            return targetView;
        }
    }

    return nil;
}


@end
