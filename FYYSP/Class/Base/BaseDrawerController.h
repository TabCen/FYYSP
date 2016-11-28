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

@property(nonatomic) BOOL       drawerShowTableView;        //  默认为否，可自定义

@property(nullable,nonatomic,weak) id <drawerControllerDelegate> delegate;

-(void)handlePan:(UIPanGestureRecognizer *)pan;

-(void)sonControllerTransitionFrom:(NSIndexPath *)oldIndex toControllerIndex:(NSIndexPath *)newIndex;

@end

