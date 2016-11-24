//
//  BaseTabBar.m
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "BaseTabBar.h"

@interface BaseTabBar ()

@property(nonatomic,strong)UIButton *moreButton;

@property (nonatomic,strong) UIImage    *centerImage;

@end

@implementation BaseTabBar

-(instancetype)initWithCenterButton_andCenterBtnImage:(UIImage *)image{
    self = [self init];
    if (self) {
        self.centerImage = image;
        
        [self setUpCenterImageBtn];
        
    }
    return self;
}


-(void)setUpCenterImageBtn{
    //如果存在则设置中间按钮图片
    if (_centerImage) {
        //添加中间按钮
        self.moreButton=[[UIButton alloc] initWithFrame:CGRectZero];
        _moreButton.layer.cornerRadius=22;
        [_moreButton setBackgroundImage:_centerImage forState:UIControlStateNormal];
        [_moreButton setBackgroundImage:_centerImage forState:UIControlStateHighlighted];
        [self addSubview:_moreButton];
        [self bringSubviewToFront:_moreButton];
        
        [_moreButton addTarget:self action:@selector(moreButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        
        __weak typeof(self) weakself=self;
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@60);    //44
            make.height.equalTo(@60);   //44
            //            make.center.equalTo(weakself);
            make.centerX.equalTo(weakself);
            make.centerY.equalTo(weakself).offset(-20);
        }];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (_centerImage) {
        
        CGFloat tabBarButtonW = self.frame.size.width / 5.0f;
        
        CGFloat y=self.subviews[0].frame.origin.y;
        CGFloat h=self.subviews[0].frame.size.height;
        
        NSInteger index = 0;
        
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [view setFrame:CGRectMake(index*tabBarButtonW, y, tabBarButtonW, h)];
                
                if (index == 1) {//这里表示当index为2时跳过
                    index++;
                }
                index++;
            }
        }
    }
}

-(void)moreButtonClicked{
    //按钮触发的条件
    if (self.centerImage&&self.btnDelegate&&[self.btnDelegate respondsToSelector:@selector(moreButtonClicked)]) {
        [self.btnDelegate performSelector:@selector(moreButtonClicked) withObject:nil];
    }
}


@end
