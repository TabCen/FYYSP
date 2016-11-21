//
//  MainViewController.m
//  MYBUDEJIE
//
//  Created by  chenfei on 16/8/10.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MainViewController.h"
#import "BaseTabBar.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h"

@interface MainViewController ()<BaseTabBarDelegate>

@property(nonatomic,strong)UIButton *moreButton;        //更多按钮

//@property(nonatomic,strong)BaseTabBar *tabBar;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //将原先的tabBar移除
    [self.tabBar removeFromSuperview];
    
    //将自己设置的TabBar设置为Controller的tabBar，使用KVC的方法
    BaseTabBar *tabBar=[[BaseTabBar alloc]init];
    tabBar.btnDelegate=self;
    [self setValue:tabBar forKey:@"tabBar"];                ///****************暴力设置的方法*************/
    
    //设置子控制器，以及控制器tabBarItem
    [self setSubViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 子控制器设置

/**
 *  设置子控制器，以及控制器tabBarItem
 */
-(void)setSubViewController{
    HomeViewController      *VC1 = [[HomeViewController alloc] init];
    UIViewController        *VC2 = [[UIViewController alloc] init];
    UIViewController        *VC3 = [[UIViewController alloc] init];
    UIViewController        *VC4 = [[UIViewController alloc] init];
    
    BaseNavigationController *nav1=[[BaseNavigationController alloc]initWithRootViewController:VC1];
    BaseNavigationController *nav2=[[BaseNavigationController alloc]initWithRootViewController:VC2];
    BaseNavigationController *nav3=[[BaseNavigationController alloc]initWithRootViewController:VC3];
    BaseNavigationController *nav4=[[BaseNavigationController alloc]initWithRootViewController:VC4];
    
    self.viewControllers=@[nav1,nav2,nav3,nav4];
    
    //设置每个TabbarItem的属性
    NSArray * tabMessage    = @[@"首页",@"阅读",@"通告",@"我的"];
    NSArray * tabImages     = @[@"icon_tabbar_home_25x25_",@"icon_tabbar_subscription_25x25_",@"icon_tabbar_notification_25x25_",@"icon_tabbar_me_25x25_"];
    NSArray * tabSelImages  = @[@"icon_tabbar_home_active_25x25_",@"icon_tabbar_subscription_active_25x25_",@"icon_tabbar_notification_active_25x25_",@"icon_tabbar_me_active_25x25_"];
    
    for(int i=0;i<self.viewControllers.count;++i){
        UIViewController *vc=self.viewControllers[i];
        vc.tabBarItem.title=tabMessage[i];
        //保存图片本身的颜色
        vc.tabBarItem.image=[[UIImage imageNamed:tabImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage=[[UIImage imageNamed:tabSelImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.titlePositionAdjustment=UIOffsetMake(0, -3);
        
        //设置字的颜色
        [vc.tabBarItem setTitleTextAttributes:@{
                                                NSForegroundColorAttributeName :[UIColor grayColor]
                                                }
                                     forState:UIControlStateNormal];
        
        [vc.tabBarItem setTitleTextAttributes:@{
                                                NSForegroundColorAttributeName : COLOR(100, 100, 100, 1)
                                                }
                                     forState:UIControlStateSelected];
        //设置字体的Attributes
        //        NSFontAttributeName:[UIFont systemFontOfSize:8]
    }
}

#pragma mark - btnDeleage

-(void)moreButtonClicked{
    NSLog(@"你点击了中间的按钮");
    
}


@end
