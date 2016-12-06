//
//  UIViewController+BaseCategory.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/22.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UIViewController+BaseCategory.h"

@implementation UIViewController (BaseCategory)

-(void)setNavBar{
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 18)];
    [backBtn setImage:[UIImage imageNamed:@"cancel-left"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setNavRightBarBtnItemWithImage:( UIImage * _Nullable )image function:(nullable SEL)action{
    UIBarButtonItem *right_Bar_Btn=
    [[UIBarButtonItem alloc]initWithImage:image
                                    style:UIBarButtonItemStylePlain
                                   target:self
                                   action:action];
    [right_Bar_Btn setTintColor: k_BaseColor];
    
    [self.navigationItem setRightBarButtonItem:right_Bar_Btn];
}


@end
