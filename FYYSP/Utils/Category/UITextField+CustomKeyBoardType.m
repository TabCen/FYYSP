//
//  UITextField+CustomKeyBoardType.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UITextField+CustomKeyBoardType.h"
#import <objc/runtime.h>

static char *keyKeyboard = "keyKeyboard";

static char *keyDataArray = "keyDataArray";

@implementation UITextField (CustomKeyBoardType)

-(void)setUpInputView:(KeyBoardType *)keyboardType{
    if ([keyboardType isEqualToString:keyBoardType_DatePicker])         {[self datePicker];}
    else if ([keyboardType isEqualToString:keyBoardType_DatePicker2])   {[self datePicker2];}
    else if ([keyboardType isEqualToString:keyBoardType_PickData])      {[self pickData];}
    else if ([keyboardType isEqualToString:keyBoardType_Default])       {[self defaultInputView];}
    
}

#pragma mark - 键盘的inputView类型

-(void)datePicker{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *maxDate = [formatter dateFromString:@"2116-01-01"]; //  大概一百年吧
    NSDate *minDate = [NSDate date];
    
    UIDatePicker *datepicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kKeyBoardHight)];
    datepicker.datePickerMode = UIDatePickerModeDate;
    datepicker.minimumDate = minDate;
    datepicker.maximumDate = maxDate;
    
    [datepicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self addTarget:self action:@selector(selfendEditing:) forControlEvents:UIControlEventEditingDidEnd];
    [self addTarget:self action:@selector(selfDidBegining:) forControlEvents:UIControlEventEditingDidBegin];
    
    ///设置默认的时间，如果不设置，点击后会显示在当前显示的
    datepicker.date = minDate;
    
    self.inputView = datepicker;
}

-(void)datePicker2{
    
    
}

-(void)pickData{
    UIPickerView *picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kKeyBoardHight)];
    
    
    
    self.inputView = picker;
}

-(void)defaultInputView{


}

#pragma mark - 私人方法

-(void)datePickerValueChanged:(id)sender{
    if ([self.inputView isKindOfClass:[UIDatePicker class]]) {
        UIDatePicker *picker = (UIDatePicker *)self.inputView;
        NSDateFormatter *formatter = [NSDateFormatter new];
        
        [formatter setDateFormat:@"yyyy-MM-dd"];
        NSString *dateStr = [NSString stringWithFormat:@"%@",[formatter stringFromDate:picker.date]];
        
        self.text = dateStr;
    }
}

-(void)selfendEditing:(id)sender{
    [self datePickerValueChanged:@"END"];
    
}

-(void)selfDidBegining:(id)sender{
    
    UIDatePicker *datePicker = (UIDatePicker *)self.inputView;
    
    [datePicker setDate:[NSDate date] animated:NO];
}

#pragma mark - 懒加载
-(void)setCf_keyboardType:(KeyBoardType *)cf_keyboardType{
//    objc_setAssociatedObject(self, @selector(cf_keyboardType), cf_keyboardType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &keyKeyboard, cf_keyboardType, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setUpInputView:cf_keyboardType];
}

-(KeyBoardType *)cf_keyboardType{
//    return objc_getAssociatedObject(self, @selector(cf_keyboardType));
    return objc_getAssociatedObject(self, &keyKeyboard);
}

-(void)setCf_dataArray:(NSArray *)cf_dataArray{
    objc_setAssociatedObject(self, &keyDataArray, cf_dataArray, OBJC_ASSOCIATION_COPY);
    
}

-(NSArray *)cf_dataArray{
    return objc_getAssociatedObject(self, &keyDataArray);
}


@end
