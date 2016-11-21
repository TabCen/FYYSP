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

@end

@implementation BaseTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
        //添加中间按钮
        self.moreButton=[[UIButton alloc] initWithFrame:CGRectZero];
        _moreButton.layer.cornerRadius=22;
        [_moreButton setBackgroundImage:[UIImage imageNamed:@"icon_tabbar_like_active_25x25_"] forState:UIControlStateNormal];
        [_moreButton setBackgroundImage:[UIImage imageNamed:@"icon_tabbar_like_active_25x25_"] forState:UIControlStateHighlighted];
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
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
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

-(void)moreButtonClicked{
    if ([self.btnDelegate respondsToSelector:@selector(moreButtonClicked)]) {
        [self.btnDelegate performSelector:@selector(moreButtonClicked) withObject:nil];
    }
}


@end
