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



@interface ViewController ()

@property(nonatomic,strong)NSArray *array;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0 , 100 , 100, 40)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
//    [ModelOne requestDataWith_IDBlock:^(id object, NSError *error) {
//        self.array=(NSArray *)object;
//        NSLog(@"%ld",self.array.count);
//    }];
//    NSLog(@"%ld",[@"000012" integerValue]);

    //实现了model层进行网络请求。网络请求在model层对象对应的类方法中进行，通过回调的方法把请求的数据传给控制器。
//    [ModelOne requestDataWith_ArrayBlock:^(NSArray *array, NSError *error) {
//        self.array=array;
//        NSLog(@"%ld",self.array.count);
//    }];
    
    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 250, 100, 40)];
    button2.backgroundColor=[UIColor blueColor];
    [button2 addTarget:self action:@selector(button2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 400, 100, 40)];
    button3.backgroundColor=[UIColor blueColor];
    [button3 addTarget:self action:@selector(requestImageVerify) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
}


- (void)buttonClicked:(id)sender{
    
    UIViewController *b=[[UIViewController alloc]init];
    b.view.backgroundColor=[UIColor redColor];
    [self.navigationController pushViewController:b animated:YES];
    
//    BaseViewController *baseVC=[[BaseViewController alloc]init];
//    baseVC.hidesBottomBarWhenPushed=YES;
//    baseVC.hideNavigationBar=YES;
//    baseVC.allowPanBackGesture_system=YES;
//    [self.navigationController pushViewController:baseVC animated:YES];
    
//    NSURLSession *session=[NSURLSession sharedSession];
//    
//    NSURL *url=[NSURL URLWithString:@"http://api.budejie.com/api/api_open.php"];
//    
//    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (!error) {
//            
//        }
//    }];
//    
//    [task resume];
    
}

-(void)button2Clicked:(id)sender{
    NSURL *url=[NSURL URLWithString:@"http://api.budejie.com"];
    
    AFHTTPSessionManager *manage=[[AFHTTPSessionManager alloc]initWithBaseURL:url];
//    AFURLSessionManager *manage_URL=[[AFURLSessionManager alloc]init];
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]initWithCapacity:20];
    dict[@"a"]=@"list";
    dict[@"c"]=@"data";
    NSLog(@"%@",dict);
    
    manage.requestSerializer=[AFJSONRequestSerializer serializer];
    
    manage.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [manage GET:@"/api/api_open.php" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"失败了");
    }];
    

}

-(void)requestImageVerify{
    NSMutableDictionary *parms= [NSMutableDictionary dictionary ];
    //公共参数
    parms[@"fund['function']"] = @"NP015";//功能号
    parms[@"fund['fundchannel']"]=@"ios";
    
    AFHTTPSessionManager *requestSessionManager=[AFHTTPSessionManager manager];
    
    requestSessionManager.responseSerializer=[AFJSONResponseSerializer serializer];
    
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
