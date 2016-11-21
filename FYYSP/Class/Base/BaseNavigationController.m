//
//  BaseNavigationController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
