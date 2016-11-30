//
//  BaseViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/10.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIGestureRecognizer *gesture;

@end

@class BaseDrawerController;

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self allow_Nav_InteractivePopGesture];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:self.hideNavigationBar animated:animated];//No 为显示 Navigationbar Yes 为隐藏
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];//No 为显示 Navigationbar Yes 为隐藏
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)allow_Nav_InteractivePopGesture{
    if (!self.allowPanBackGesture_system) {
        return;
    }
    
    if (DEVICE_SYSTEM_VERSION>=7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled=YES;
        self.navigationController.interactivePopGestureRecognizer.delegate=self;
    }
    
//    NSArray *gestureArray = self.navigationController.view.gestureRecognizers;//获取所有的手势
//    for (UIGestureRecognizer *gesture in gestureArray) {
//        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//            //当是侧滑手势的时候设置panGestureRecognizer需要UIScreenEdgePanGestureRecognizer失效才生效即可
//            [self.view.panGestureRecognizer requireGestureRecognizerToFail:gesture];
//        }
//    }
}

#pragma mark - 手势代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }else{
        return YES;
    }
}


#pragma mark - 常用方法

- (void)setBackButton:(BOOL)isShown{
    if (isShown)
    {
        UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 18)];
        [backBtn setImage:[UIImage imageNamed:@"cancel-left"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [backBtn setTintColor:k_BaseColor];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    } else
    {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

-(void)_showAlertViewWithTitle:(NSString *)tittle message:(NSString *)message insureBtn:(NSString *)insureStr cancleBtn:(NSString *)cancleStr{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:tittle
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    if (insureStr) {
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:insureStr style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:defaultAction];
    }
    
    if (cancleStr) {
        UIAlertAction* cancleAction = [UIAlertAction actionWithTitle:cancleStr style:UIAlertActionStyleCancel
                                                              handler:^(UIAlertAction * action) {}];
        [alert addAction:cancleAction];
    }
    
    if (!(cancleStr||insureStr)) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}



/**
 设置是否是有左边抽屉

 @param haveLeftDrawer YES表示有，NO无
 */
-(void)setHaveLeftDrawer:(BOOL)haveLeftDrawer{
    _haveLeftDrawer = haveLeftDrawer;
    
    if (haveLeftDrawer) {
        [self setupPanGesture];
    }
}


-(void)setupPanGesture{
    if (self.parentViewController) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self.parentViewController action:@selector(handlePan:)];
        pan.delegate=self;
        [self.view addGestureRecognizer:pan];
    }
}

@end
