//
//  MainDrawerController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MainDrawerController.h"

#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "ReadingViewController.h"
#import "TestingViewController.h"
#import "MineViewController.h"


@interface MainDrawerController ()

@end

@implementation MainDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController      *VC1 = [[HomeViewController alloc] init];
    ReadingViewController   *VC2 = [[ReadingViewController alloc] init];
    TestingViewController   *VC3 = [[TestingViewController alloc] init];
    MineViewController      *VC4 = [[MineViewController alloc] init];
    
    BaseNavigationController *nav1=[[BaseNavigationController alloc]initWithRootViewController:VC1];
    BaseNavigationController *nav2=[[BaseNavigationController alloc]initWithRootViewController:VC2];
    BaseNavigationController *nav3=[[BaseNavigationController alloc]initWithRootViewController:VC3];
    BaseNavigationController *nav4=[[BaseNavigationController alloc]initWithRootViewController:VC4];
    
//    self.viewControllers = @[VC1,VC2,VC3,VC4];
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
    self.tittles = @[@"首页",@"阅读",@"试验",@"我的"];
    
    self.images = @[@"icon_tabbar_home_25x25_",@"icon_tabbar_subscription_25x25_",@"icon_tabbar_notification_25x25_",@"icon_tabbar_me_25x25_"];
    
    self.selectImages = @[@"icon_tabbar_home_active_25x25_",@"icon_tabbar_subscription_active_25x25_",@"icon_tabbar_notification_active_25x25_",@"icon_tabbar_me_active_25x25_"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
