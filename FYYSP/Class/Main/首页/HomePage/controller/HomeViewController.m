//
//  HomeViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/21.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "HomeViewController.h"

#import "SettingViewController.h"

#import "UIViewController+BaseExtension.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationItem.title = @"afdsaf";
    
    self.navigationItem.title = @"首页";
    
    [self setNavRightBarBtnItemWithImage:[UIImage imageNamed:@"button_write_toolbar_more"]
                                function:@selector(rightBarBtnClicked)];
//    [self _setNavigationBar];
}

//-(void)_setNavigationBar{
//    UIBarButtonItem *right_Bar_Btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"button_write_toolbar_more"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClicked)];
//    [right_Bar_Btn setTintColor: k_BaseColor];
//    
//    [self.navigationItem setRightBarButtonItem:right_Bar_Btn];
//}

-(void)rightBarBtnClicked{
    SettingViewController *setVC=[[SettingViewController alloc]init];
    
    setVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:setVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
