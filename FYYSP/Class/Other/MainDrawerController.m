//
//  MainDrawerController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MainDrawerController.h"
#import "HomeViewController.h"

@interface MainDrawerController ()

@end

@implementation MainDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController      *VC1 = [[HomeViewController alloc] init];
    UIViewController        *VC2 = [[UIViewController alloc] init];
    UIViewController        *VC3 = [[UIViewController alloc] init];
    UIViewController        *VC4 = [[UIViewController alloc] init];
    
    self.viewControllers = @[VC1,VC2,VC3,VC4];
    
    self.tittles = @[@"首页",@"阅读",@"试验",@"我的"];
    
    self.images = @[@"icon_tabbar_home_25x25_",@"icon_tabbar_subscription_25x25_",@"icon_tabbar_notification_25x25_",@"icon_tabbar_me_25x25_"];
    
    self.selectImages = @[@"icon_tabbar_home_active_25x25_",@"icon_tabbar_subscription_active_25x25_",@"icon_tabbar_notification_active_25x25_",@"icon_tabbar_me_active_25x25_"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
