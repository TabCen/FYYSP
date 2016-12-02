//
//  UIImage+CommonFunction.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/2.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UIImage+CommonFunction.h"

@implementation UIImage (CommonFunction)

+(UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIImage *)imageWithCornerRect{
    return [self imageToSize:CGSizeMake(self.size.width, self.size.height) cornerRect:self.size.width/2.0f];
}

-(UIImage *)imageToSize:(CGSize)toSize cornerRect:(CGFloat)cornerRect{
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, self.scale);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRect, cornerRect)];
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
    
    [path addClip];         //裁剪方法
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


@end
