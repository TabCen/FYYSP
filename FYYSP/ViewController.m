//
//  ViewController.m
//  FYYSP
//
//  Created by  chenfei on 16/9/29.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ViewController.h"
#import "ModelOne.h"



@interface ViewController ()

@property(nonatomic,strong)NSArray *array;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0 , 100 , 100, 40)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
//    [ModelOne requestDataWith_IDBlock:^(id object, NSError *error) {
//        self.array=(NSArray *)object;
//        NSLog(@"%ld",self.array.count);
//    }];
//    NSLog(@"%ld",[@"000012" integerValue]);

    //实现了model层进行网络请求。网络请求在model层对象对应的类方法中进行，通过回调的方法把请求的数据传给控制器。
//    [ModelOne requestDataWith_ArrayBlock:^(NSArray *array, NSError *error) {
//        self.array=array;
//        NSLog(@"%ld",self.array.count);
//    }];
}


- (void)buttonClicked:(id)sender{
    
    BaseViewController *baseVC=[[BaseViewController alloc]init];
    baseVC.hidesBottomBarWhenPushed=YES;
    baseVC.hideNavigationBar=YES;
    baseVC.allowPanBackGesture_system=YES;
    [self.navigationController pushViewController:baseVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
