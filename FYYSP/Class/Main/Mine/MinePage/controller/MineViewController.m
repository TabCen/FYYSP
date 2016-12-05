//
//  MineViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MineViewController.h"

#import "LoginingWindow.h"

#import "NSString+Hash.h"

#import "UFO.h"

#import "YYCache.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnClicked{
    
    
    NSString *timeStamp = [UFO timeStamp];
    
    NSDictionary *dict=@{
                         @"fund['currentpage']":@"1",
                         @"fund['pagesize']":@"30",
                         @"fund['newstype']":@"1",
                         @"fund['function']":@"N003",
                         @"fund['fundchannel']":@"ios",
                         @"fund['timestamp']":[NSString stringWithFormat:@"%@|%@",timeStamp,[[NSString stringWithFormat:@"%@%@%@",@"@newtouch!",timeStamp,@"@newtouch!"] md5String]] //时间戳(N)
                         };
    
    [[CFNetworkingManager manager] GET:FCL_URL parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
        YYCache *cache = [YYCache cacheWithName:@"firstName"];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    } showHUD:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
