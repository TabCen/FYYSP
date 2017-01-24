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

#import "CFFileManager.h"

#import "BaseNavigationController.h"

#import "UIImage+CommonFunction.h"

#import "CFFileManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"沙盒目录%@",kPathCache);
    
    self.navigationItem.title = @"首页";
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setNavRightBarBtnItemWithImage:[UIImage imageNamed:@"set"]
                                function:@selector(rightBarBtnClicked)];
    
    [self otherThings];
    
//    CFFileManager *manage = [CFFileManager new];

//    NSString *path = [NSString stringWithFormat:@"%@/MYCFITEM.FYYSP.MineFile",kPathCache];

//    NSLog(@"%f",[manage folderSizeAtPath:path]);

    
}

-(void)otherThings{
    UIButton *showBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    showBtn.backgroundColor = [UIColor whiteColor];
    [showBtn setTitle:@"开" forState:UIControlStateNormal];
    [showBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(showNavBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    UIButton *hidBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 100, 40)];
    hidBtn.tag = 100;
    [hidBtn setTitle:@"关" forState:UIControlStateNormal];
    [hidBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    hidBtn.backgroundColor = [UIColor whiteColor];
    [hidBtn addTarget:self action:@selector(hideNavBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hidBtn];
}

-(void)hideNavBar{
    BaseNavigationController *nav = (BaseNavigationController *)self.navigationController;
    
    [nav hideBarWithAnimation:YES];
}

-(void)showNavBar{
    BaseNavigationController *nav = (BaseNavigationController *)self.navigationController;
    
    [nav showBarWithAnimation:YES];
}


-(void)rightBarBtnClicked{
    
    SettingViewController *setVC=[[SettingViewController alloc]init];
    
    setVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:setVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
