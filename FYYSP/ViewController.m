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

-(void)btnclicked{
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

-(void)btn1didClicked{
    
    [[CFNetworkingManager manager] GET:@"http://api.budejie.com/api/api_open.php?a=list&c=data" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"%@",error);
        }
    } showHUD:YES];
    
}

-(void)btn2didClicked{
    NSMutableDictionary *parms= [NSMutableDictionary dictionary ];
    //公共参数
    parms[@"fund['function']"] = @"NP015";//功能号
    parms[@"fund['fundchannel']"]=@"ios";
    
    CFNetworkingManager *manager= [[CFNetworkingManager alloc]init];
    
    manager.responseSerializer = Type_AFHTTPResponseSerializer;
    
    [manager POST:@"https://app.gomefund.com/fundApp/passportRequestImp.json?" parameters:parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *tempStr=[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        tempStr =[tempStr stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
        tempStr =[tempStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        NSLog(@"--->>>>\n%@",tempStr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"失败了");
        }
    } showHUD:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
