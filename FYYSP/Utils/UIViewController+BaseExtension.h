//
//  UIViewController+BaseExtension.h
//  CFSegmentViewDemo
//
//  Created by  chenfei on 2016/11/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BaseExtension)

-(void)setNavBar;

-(void)setNavRightBarBtnItemWithImage:(UIImage *)image function:(nullable SEL)action;


@end
