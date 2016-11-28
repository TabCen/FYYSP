//
//  BaseDrawerController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseDrawerController.h"

#import "BaseViewController.h"

@interface BaseDrawerController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic)CGFloat scalef;

@property(nonatomic)BOOL    isOpen;

@property(nonatomic,weak)UIViewController *currentVC;

@property(nonatomic,strong)UITableView     *tableview;

@property(nonatomic,strong)NSIndexPath     *currentIndexPath;

@end

@implementation BaseDrawerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    if (_drawerShowTableView) {
        
        self.tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DefineOpenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        
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
        //        self.currentVC.view.transform = CGAffineTransformTranslate(self.currentVC.view.transform, point.x, 0);
        //        if (self.currentVC.view.frame.origin.x+self.scalef<0) {
        //            NSLog(@"%lf +++++ %lf",self.currentVC.view.frame.origin.x,self.scalef);
        //            self.scalef = self.currentVC.view.frame.origin.x;
        //            canMove = NO;
        //        }
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
        
    }];
}

-(void)close{
    if (fabs(self.currentVC.view.frame.origin.x)<=20) {
        self.currentVC.view.transform = CGAffineTransformIdentity;
    }else{        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.currentVC.view.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}

-(void)openDrawer{
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.currentVC.view.transform = CGAffineTransformMakeTranslation(self.openWidth, 0);
    } completion:^(BOOL finished) {
        
    }];
}

-(void)closeDrawer{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.currentVC.view.transform = CGAffineTransformIdentity;
    } completion:nil];
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
                vc.view.frame = [UIScreen mainScreen].bounds;
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