//
//  MineViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MineViewController.h"

#import "UITextField+CustomKeyBoardType.h"

#import "SelfButton.h"

//#import "UIButton+CommonFunction.h"

//#import "SelfButton+heheTest.h"

@interface MineViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)NSArray  *tittleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 10, 10)];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    btn.cf_expand_width = -20;
    
    [self.view addSubview:btn];
    
//    NSLog(@"%lf",btn.expand_width);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(taptheView:)];
    [self.view addGestureRecognizer:tap];
    UITextField *textfield1 = [[UITextField alloc]initWithFrame:CGRectMake(0, kScreenHeight -300, kScreenWidth, 40)];
    textfield1.cf_keyboardType = keyBoardType_PickData;
    textfield1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:textfield1];
    
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(0, kScreenHeight -200, kScreenWidth, 40)];
    textfield.backgroundColor = [UIColor grayColor];
    textfield.cf_keyboardType = keyBoardType_DatePicker;
    textfield.delegate = self;
    [self.view addSubview:textfield];
    
//    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(120, 120, 200, 200)];
//    [view1 setBackgroundColor:[UIColor grayColor]];//view1 设置为灰色
//    [self.view addSubview:view1];
    
//    //根据view1的大小变换后创建view2;
//    CGRect view2Rect=CGRectInset(view1.frame, 20, 20);
//    UIView *view2=[[UIView alloc]initWithFrame:view2Rect];
//    [view2 setBackgroundColor:[UIColor blueColor]];//view2 设置为蓝色
//    [self.view addSubview:view2];
}

-(void)btnClicked:(id)sender{
    [self _showAlertViewWithTitle:@"提示" message:@"触发了" insureBtn:@"知道了" cancleBtn:nil];
    
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
    NSLog(@"点击了");
//    NSLog(@"选择了：%@",[NSString stringWithFormat:@"%@",self.tittleArray[row]]);
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(void)taptheView:(id)sender{
    [self.view endEditing:YES];
}

@end
