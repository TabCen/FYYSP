//
//  LeaderViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/13.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "LeaderViewController.h"
#import "AppDelegate.h"

@interface LeaderViewController ()

@end

@implementation LeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)enterMainVC:(id)sender {
    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app enterMainViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
