//
//  UITextField+CustomKeyBoardType.h
//  FYYSP
//
//  Created by  chenfei on 2016/12/8.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString KeyBoardType;

static KeyBoardType * const keyBoardType_Default = @"keyBoardType_Default";
static KeyBoardType * const keyBoardType_PickData = @"keyBoardType_PickData";
static KeyBoardType * const keyBoardType_DatePicker = @"keyBoardType_DatePicker";
static KeyBoardType * const keyBoardType_DatePicker2 = @"keyBoardType_DatePicker2";

//typedef NS_ENUM(NSInteger, CFKeyboardType) {
//    CFKeyboardType_default,
//};

@interface UITextField (CustomKeyBoardType)

@property(nonatomic,copy)KeyBoardType * cf_keyboardType;

@property(nonatomic,strong)NSArray  * cf_dataArray;

//@property(nonatomic) CFKeyboardType  my_keyboardType;

@end
