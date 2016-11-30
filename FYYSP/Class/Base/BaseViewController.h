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

@property(nonatomic,assign)BOOL haveLeftDrawer;

#pragma mark - 常用方法


/**
 设置回退按钮

 @param isShown 是否显示 默认不显示
 */
- (void)setBackButton:(BOOL)isShown;

/**
 AlertViewController的快速集成

 @param tittle 标题
 @param message 信息
 @param insureStr 确定按钮文字
 @param cancleStr 取消按钮文字
 */
-(void)_showAlertViewWithTitle:(NSString *)tittle message:(NSString *)message insureBtn:(NSString *)insureStr cancleBtn:(NSString *)cancleStr;

@end
