//
//  BaseViewController.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/10.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,assign)BOOL allowPanBackGesture_system;

@property(nonatomic,assign)BOOL hideNavigationBar;

#pragma mark - 常用方法

- (void)setBackButton:(BOOL)isShown;

@end
