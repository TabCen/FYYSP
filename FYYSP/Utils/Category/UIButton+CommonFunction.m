//
//  UIButton+CommonFunction.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/27.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UIButton+CommonFunction.h"

#import <objc/runtime.h>

static void * cf_expandWidth = &cf_expandWidth;

@implementation UIButton (CommonFunction)

-(void)setCf_expand_width:(CGFloat)cf_expand_width{
    objc_setAssociatedObject(self, &cf_expandWidth, @(cf_expand_width), OBJC_ASSOCIATION_ASSIGN);
    //如果设置了就修改这两个方法
    if (cf_expand_width) {
        //设置了关联后可根据expand_width设置方法挂钩
        [self start_method_swizzlingFounction];
    }
}

-(CGFloat)cf_expand_width{
    return [objc_getAssociatedObject(self, &cf_expandWidth) floatValue];
}

-(void)start_method_swizzlingFounction{
    Method ori_Method = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    Method my_Method = class_getInstanceMethod([self class], @selector(cf_hitTest:withEvent:));
    //调换方法
    method_exchangeImplementations(ori_Method, my_Method);
}

-(void)end_Method_SwizzlingFounction{
    Method ori_Method = class_getInstanceMethod([self class], @selector(hitTest:withEvent:));
    Method my_Method = class_getInstanceMethod([self class], @selector(cf_hitTest:withEvent:));
    //调换方法
    method_exchangeImplementations(ori_Method, my_Method);
}

-(UIView *)cf_hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (![UIButton instancesRespondToSelector:@selector(cf_expand_width)]) {
        return [self cf_hitTest:point withEvent:event];
    }
    if (self.cf_expand_width==0) {
        return [self cf_hitTest:point withEvent:event];
    }
    
    //返回nil表示手势不作用在这个视图上
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha<=0.01) {
        return nil;
    }
    
    CGRect touchRect = CGRectInset(self.bounds, self.cf_expand_width, self.cf_expand_width);
    
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
