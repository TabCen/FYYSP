//
//  MineViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic,strong)NSArray  *tittleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.tittleArray = @[@"111",@"222",@"333",@"444",@"555"];
    
    self.navigationItem.title = @"我的";
    
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    
    UIDatePicker *datapicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 300, kScreenWidth, 216)];
    
    datapicker.datePickerMode = UIDatePickerModeDate;
    
    [self.view addSubview:datapicker];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pickerView代理
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.tittleArray.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    return [NSString stringWithFormat:@"%@",self.tittleArray[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    NSLog(@"选择了%@",[NSString stringWithFormat:@"%@",self.tittleArray[row]);
    NSLog(@"选择了：%@",[NSString stringWithFormat:@"%@",self.tittleArray[row]]);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//UITextField *textfield1 = [[UITextField alloc]initWithFrame:CGRectMake(0, kScreenHeight -150, kScreenWidth, 40)];
//
//textfield1.backgroundColor = [UIColor grayColor];
//
//[self.view addSubview:textfield1];
//
//UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, kScreenHeight -100, kScreenWidth, 40)];
//
//textfield.backgroundColor = [UIColor grayColor];
//
//UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kKeyBoardHight)];
//view.backgroundColor = [UIColor redColor];
//
//textfield.inputView = view;
//
//[self.view addSubview:textfield];

@end
