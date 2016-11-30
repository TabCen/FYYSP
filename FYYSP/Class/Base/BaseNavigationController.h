//
//  BaseNavigationController.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface BaseNavigationController : UINavigationController

@property(nonatomic,assign)BOOL haveLeftDrawer;

-(void)hideBarWithAnimation:(BOOL)animation;
-(void)showBarWithAnimation:(BOOL)animation;

@end
