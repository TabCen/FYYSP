//
//  MineViewController.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/28.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "MineViewController.h"

#import "UITextField+CustomKeyBoardType.h"

@interface MineViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)NSArray  *tittleArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
//    self.extendedLayoutIncludesOpaqueBars = NO;
    
    self.tittleArray = @[@"111",@"222",@"333",@"444",@"555"];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    self.pickView.showsSelectionIndicator = NO;
    
    self.navigationItem.title = @"我的";
    


    
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

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}

-(void)taptheView:(id)sender{
    
    [self.view endEditing:YES];
}

@end
