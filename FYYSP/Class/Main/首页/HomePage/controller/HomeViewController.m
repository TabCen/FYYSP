//
//  HomeViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "HomeViewController.h"

#import "SettingViewController.h"

#import "UIViewController+BaseCategory.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"沙盒目录%@",kPathCache);
    
    self.navigationItem.title = @"首页";
    
    [self setNavRightBarBtnItemWithImage:[UIImage imageNamed:@"set"]
                                function:@selector(rightBarBtnClicked)];
    
}

-(void)rightBarBtnClicked{
    
    SettingViewController *setVC=[[SettingViewController alloc]init];
    
    setVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:setVC animated:YES];
}

@end
