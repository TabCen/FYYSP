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

#import "UFO.h"

#import "SegmentViewController.h"

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
    
    CFFileManager *manage = [CFFileManager new];
    
    NSString *path = [NSString stringWithFormat:@"%@/MYCFITEM.FYYSP.MineFile",kPathCache];
    
    NSLog(@"沙盒文件大小 %f",[manage folderSizeAtPath:path]);
    
    
//    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc]initWithString:@"http:www.cctv.com"];
//    
//    [mut addAttributes:{} range:NSMakeRange(0, mut.length)];
//    
//    UIButton *btnt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
//    
//    [btnt setAttributedTitle:mut forState:UIControlStateNormal];
    
    
    
    
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
    
    UIButton *showSegVC = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, 100, 40)];
    showSegVC.backgroundColor = [UIColor blueColor];
    [showSegVC addTarget:self action:@selector(toSegmentViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showSegVC];
    
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

#pragma mark - 测试专用

-(void)toSegmentViewController{
    //跳转到测试cegment控制器中
    SegmentViewController *vc = [[SegmentViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}





@end
