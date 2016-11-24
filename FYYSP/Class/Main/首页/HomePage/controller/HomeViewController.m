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

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [CFFileManager createFileInPreferences_FileName:@""];
    
    NSLog(@"---++++????>>>>%@",kPathDocument);
    
    self.navigationItem.title = @"首页";
    
    [self setNavRightBarBtnItemWithImage:[UIImage imageNamed:@"set"]
                                function:@selector(rightBarBtnClicked)];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"123" forKey:@"first"];
    
    [self otherThings];
    
}

-(void)otherThings{
    
    
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
