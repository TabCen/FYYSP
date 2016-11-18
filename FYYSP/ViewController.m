//
//  ViewController.m
//  FYYSP
//
//  Created by  chenfei on 16/9/29.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "ViewController.h"
#import "ModelOne.h"
#import "MBProgressHUD.h"

#import "CFNetworkingManager.h"



@interface ViewController ()

@property(nonatomic,strong)NSArray *array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets=YES;
    self.extendedLayoutIncludesOpaqueBars=NO;

    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 addTarget:self action:@selector(btn1didClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 100, 40)];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(btn2didClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    

}

-(void)btn1didClicked{

    NSURL *url = [NSURL URLWithString:@"http://api.budejie.com/api/api_open.php?a=list&c=data"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];

    NSURLSession *session=[NSURLSession sharedSession];

    NSURLSessionDataTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@",error);
        }else{
            
            NSLog(@"%@",data);
        }
    }];
    
    [task resume];
    
}

-(void)btn2didClicked{
    
    
    
}

-(void)requestImageVerify{
    NSMutableDictionary *parms= [NSMutableDictionary dictionary ];
    //公共参数
    parms[@"fund['function']"] = @"NP015";//功能号
    parms[@"fund['fundchannel']"]=@"ios";
    
    AFHTTPSessionManager *requestSessionManager=[AFHTTPSessionManager manager];
    
    requestSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [requestSessionManager POST:@"https://app.gomefund.com/fundApp/passportRequestImp.json?" parameters:parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *tempStr=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        tempStr =[tempStr stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
        tempStr =[tempStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSLog(@"--->>>>\n%@",tempStr);
        
        [MBProgressHUD hideHUDForView:self.view animated:NO];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:NO];
        NSLog(@"%@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
