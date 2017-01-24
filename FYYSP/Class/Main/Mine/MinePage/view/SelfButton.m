//
//  SelfButton.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/27.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "SelfButton.h"

@implementation SelfButton

-(void)dosomething{
    NSLog(@"做了本身的方法");
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //返回nil表示手势不作用在这个视图上
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha<=0.01) {
        return nil;
    }
    
    CGRect touchRect = CGRectInset(self.bounds, -20, -20);
    
    if (CGRectContainsPoint(touchRect, point)) {
        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
            //下面的两个方法很重要，是递归的核心
            CGPoint convertedPoint = [subview convertPoint:point toView:self];
            //调用子视图判断是否是hitTestView
            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}


@end
