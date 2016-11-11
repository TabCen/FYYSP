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

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self allow_Nav_InteractivePopGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)allow_Nav_InteractivePopGesture{
    if (!self.allowPanBackGesture) {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
