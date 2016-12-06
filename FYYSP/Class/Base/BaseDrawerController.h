//
//  BaseDrawerController.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefineOpenWidth kScreenWidth-100

@protocol drawerControllerDelegate<NSObject>

@end

@interface BaseDrawerController : UIViewController

@property(nullable, nonatomic,copy) NSArray<__kindof UIViewController *> *viewControllers;

@property(nullable,nonatomic,copy) NSArray *tittles;

@property(nullable,nonatomic,copy) NSArray *images;

@property(nullable,nonatomic,copy) NSArray *selectImages;

@property(nonatomic) NSUInteger selectedIndex;

@property(nonatomic) CGFloat    openWidth;

/**
 设置默认的左边视图，默认的左边视图为一个TableView，功能如同UITabBar。当然可以自定义，但最好子类实现
 */
@property(nonatomic) BOOL       drawerShowTableView;        //  默认为否，可自定义

@property(nullable,nonatomic,weak) id <drawerControllerDelegate> delegate;

-(void)handlePan:(UIPanGestureRecognizer *)pan;

-(void)sonControllerTransitionFrom:(NSIndexPath *)oldIndex toControllerIndex:(NSIndexPath *)newIndex;

@end

