//
//  BaseNavigationController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.navigationBar.barTintColor = k_whiteColor;   //设置颜色
//    self.navigationBar.translucent = NO;              //毛玻璃效果
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 返回状态栏的状态
//设置非导航栏状态下的状态栏状态，iOS9以后弃用，并且每一个UIViewController默认的状态栏状态为显示。所以可以不用显示，但安全起见放到rootVIewController里面再设置一下导航栏的状态
 @return 默认返回的就是NO
 */
-(BOOL)prefersStatusBarHidden{
    
    return NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
 
}
*/

#pragma mark - 设置是否有抽屉侧滑栏
-(void)setHaveLeftDrawer:(BOOL)haveLeftDrawer{
    _haveLeftDrawer = haveLeftDrawer;
    
    if (haveLeftDrawer) {
        [self setupPanGesture];
    }
}

-(void)setupPanGesture{
    if (self.parentViewController) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.parentViewController action:@selector(handlePan:)];
        pan.delegate=self;
        [self.view addGestureRecognizer:pan];
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count == 1) {
        return YES;
    }else return NO;
}

#pragma mark - 设置是否显示Bar

-(void)hideBarWithAnimation:(BOOL)animation{
    if (self.navigationBar.isHidden) {
        return;
    }
    
    if (animation) {
        [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.navigationBar.transform = CGAffineTransformTranslate(self.navigationBar.transform, 0, -64);
            
        } completion:^(BOOL finished) {
            self.navigationBar.hidden = YES;
        }];
        
        return;
    }
    self.navigationBar.hidden = YES;
}


-(void)showBarWithAnimation:(BOOL)animation{
    if (!self.navigationBar.isHidden) {
        return;
    }
    
    self.navigationBar.hidden = NO;
    if (animation) {
        [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.navigationBar.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
        return;
    }
    self.navigationBar.transform = CGAffineTransformIdentity;
}



@end
