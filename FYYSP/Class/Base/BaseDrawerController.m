//
//  BaseDrawerController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseDrawerController.h"

#import "BaseViewController.h"

#import "BaseNavigationController.h"

@interface BaseDrawerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic)CGFloat scalef;

@property(nonatomic)BOOL    isOpen;

@property(nonatomic,weak)UIViewController *currentVC;

@property(nonatomic,strong)UIView          *headView;

@property(nonatomic,strong)UITableView     *tableview;

@property(nonatomic,strong)NSIndexPath     *currentIndexPath;

@property(nonatomic,strong)UITapGestureRecognizer   *slideTapGesture;

@end

@implementation BaseDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor yellowColor];
    self.view.backgroundColor = k_TableViewBackgroundColor;
    
    if (_drawerShowTableView) {
        
        self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DefineOpenWidth, 64)];
        self.headView.backgroundColor = k_whiteColor;
        [self.view addSubview:_headView];
        
        self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, DefineOpenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
        
        self.tableview.contentInset = UIEdgeInsetsMake( 0, 0, 0, 0);
        
        _tableview.delegate = self;
        _tableview.dataSource = self;
           
        [self.view addSubview:_tableview];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(void)handlePan:(UIPanGestureRecognizer *)pan{
    
    CGPoint point = [pan translationInView:self.currentVC.view];
    
    self.scalef = point.x * 0.8;
    
    if (self.scalef>0) {
        _isOpen = YES;
    }else if (self.scalef<0){
        _isOpen = NO;
    }
    
//    NSLog(@"%lf",self.scalef);
    
    BOOL canMove = YES;
    
    if ((self.currentVC.view.frame.origin.x<=0&&_scalef <=0)||((self.currentVC.view.frame.origin.x>= (self.openWidth))&&_scalef>=0)) {
        self.scalef = 0;
        canMove = NO;
    }
    
    if (canMove) {
        self.currentVC.view.transform = CGAffineTransformTranslate(self.currentVC.view.transform, self.scalef, 0);
        [pan setTranslation:CGPointZero inView:self.currentVC.view];
    }
    
    if (pan.state ==UIGestureRecognizerStateEnded) {
        
        if (_isOpen) {
//            NSLog(@"%lf<<<%lf",kScreenWidth/3.0f,self.currentVC.view.frame.origin.x);
            if (self.currentVC.view.frame.origin.x>=(kScreenWidth/3.0f-50)) {
                [self open];
            }else{
                [self close];
            }
        }else{
//            NSLog(@"%lf>>>%lf",kScreenWidth*2/3.0f,self.currentVC.view.frame.origin.x);
            if ((self.currentVC.view.frame.origin.x<=kScreenWidth*2/3.0f)){
                [self close];
            }else{
                [self open];
            }
        }
    }
}

-(void)sonControllerTransitionFrom:(NSIndexPath *)oldIndex toControllerIndex:(NSIndexPath *)newIndex{
    
    if ([oldIndex isEqual:newIndex]) {
        return;
    }
    
    [self transitionFromViewController:self.viewControllers[oldIndex.row] toViewController:self.viewControllers[newIndex.row] duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
    } completion:^(BOOL finished) {
        
        //打开后先将开始设置的tap手势去除
        if (self.slideTapGesture) {
            [self.currentVC.view removeGestureRecognizer:self.slideTapGesture];
            self.slideTapGesture = nil;
        }
        
        self.currentVC = self.viewControllers[newIndex.row];
        self.currentIndexPath = newIndex;
        [UIView animateWithDuration:0.4 animations:^{
            self.currentVC.view.transform = CGAffineTransformIdentity;
        }];
    }];
}

#pragma mark - 私有方法
-(void)open{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.currentVC.view.transform = CGAffineTransformMakeTranslation(self.openWidth, 0);
    } completion:^(BOOL finished) {
        [self endOpeningDo];
    }];
}

-(void)close{
    if (fabs(self.currentVC.view.frame.origin.x)<=20) {
        self.currentVC.view.transform = CGAffineTransformIdentity;
    }else{        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.currentVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self endCloseingDo];
        }];
    }
}

-(void)openDrawer{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.currentVC.view.transform = CGAffineTransformMakeTranslation(self.openWidth, 0);
    } completion:^(BOOL finished) {
        [self endOpeningDo];
    }];
}

-(void)closeDrawer{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.currentVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self endCloseingDo];
    }];
}

-(void)endCloseingDo{
    [self.currentVC.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ///当关闭后需要将所有的行为打开
        [obj setUserInteractionEnabled:YES];
    }];
    
    if (self.slideTapGesture) {
        [self.currentVC.view removeGestureRecognizer:self.slideTapGesture];
        self.slideTapGesture = nil;
    }
    
}

-(void)endOpeningDo{
    [self.currentVC.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ///当打开后需要将所有的交互关闭
        [obj setUserInteractionEnabled:NO];
    }];
    
    //如果不存在手势则添加手势
    if (!self.slideTapGesture) {
        self.slideTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeDrawer)];
        
        [self.slideTapGesture setNumberOfTapsRequired:1];
        [self.slideTapGesture setNumberOfTouchesRequired:1];
        
        [self.currentVC.view addGestureRecognizer:self.slideTapGesture];
    }
}

#pragma mark - tableview代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewControllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID_drawer =@"DrawerCell_ID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID_drawer];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID_drawer];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.tittles[indexPath.row]];
    
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.images[indexPath.row]]];
    
    return cell;
}

#pragma mark --

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self sonControllerTransitionFrom:self.currentIndexPath toControllerIndex:indexPath];
    
//    self.currentVC.view.transform = CGAffineTransformMakeTranslation(self.openWidth, 0);
    
}

#pragma mark - 懒加载

-(void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    _viewControllers = viewControllers;
    
    if (viewControllers.count>0) {
        for (int i= 0; i<viewControllers.count; ++i) {
            [self addChildViewController:viewControllers[i]];
            
            if ([viewControllers[i] isKindOfClass:[BaseViewController class]]) {
                BaseViewController *vc = viewControllers[i];
                vc.haveLeftDrawer = YES;
            }
            
            if ([viewControllers[i] isKindOfClass:[BaseNavigationController class]]) {
                BaseNavigationController *nav = viewControllers[i];
                nav.haveLeftDrawer = YES;
            }
            
        }
        self.currentVC = viewControllers[0];
        self.currentIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.view addSubview:self.currentVC.view];
    }
}


-(CGFloat)openWidth{
    if (!_openWidth) {
        _openWidth = DefineOpenWidth;
    }
    return _openWidth;
}


@end
