//
//  UIImage+CommonFunction.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/2.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CommonFunction)


/**
 *  设置图片的颜色方法
 *
 *  @param color 颜色
 *
 *  @return 返回带颜色的图片
 */
+(UIImage *)imageWithColor:(UIColor *)color;


/**
    处理获得带圆角的图片

 @return 带圆角的图片
 */
-(UIImage *)imageWithCornerRect;


/**
 圆角

 @param toSize 目标大小
 @param cornerRect 圆角大小
 @return 圆角图片
 */
-(UIImage *)imageToSize:(CGSize)toSize cornerRect:(CGFloat)cornerRect;

@end
