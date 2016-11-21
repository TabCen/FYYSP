//
//  BaseTabBar.h
//  FYYSP
//
//  Created by  chenfei on 2016/11/11.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseTabBarDelegate <NSObject>
@optional
-(void)moreButtonClicked;

@end

@interface BaseTabBar : UITabBar

@property(nonatomic,weak) id <BaseTabBarDelegate> btnDelegate;

@end
