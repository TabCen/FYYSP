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
    
//    [ModelOne requestDataWith_IDBlock:^(id object, NSError *error) {
//        self.array=(NSArray *)object;
//        NSLog(@"%ld",self.array.count);
//    }];
    [ModelOne requestDataWith_ArrayBlock:^(NSArray *array, NSError *error) {
        self.array=array;
        NSLog(@"%ld",self.array.count);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
