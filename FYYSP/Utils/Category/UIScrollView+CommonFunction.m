//
//  UIScrollView+CommonFunction.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/26.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UIScrollView+CommonFunction.h"

@implementation UIScrollView (CommonFunction)

/**
 截图

 @return 图片
 */
- (UIImage *)imageOfPrintScreen
{
    UIImage* image = nil;
    UIGraphicsBeginImageContextWithOptions(self.contentSize, NO, 0.0);
    {
        CGPoint savedContentOffset = self.contentOffset;
        CGRect savedFrame = self.frame;
        self.contentOffset = CGPointZero;
        self.frame = CGRectMake(0, 0, self.contentSize.width, self.contentSize.height);
        
        [self.layer renderInContext: UIGraphicsGetCurrentContext()];
        image = UIGraphicsGetImageFromCurrentImageContext();
        
        self.contentOffset = savedContentOffset;
        self.frame = savedFrame;
    }
    UIGraphicsEndImageContext();
    
    if (image != nil) {
        return image;
    }
    return nil;
}



@end
