//
//  UIViewController+BaseCategory.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BaseCategory)

-(void)setNavBar;

-(void)setNavRightBarBtnItemWithImage:( UIImage * _Nullable )image function:(nullable SEL)action;

@end
