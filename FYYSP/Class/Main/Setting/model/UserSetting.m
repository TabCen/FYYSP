//
//  UserSetting.m
//  FYYSP
//
//  Created by  chenfei on 2016/12/13.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "UserSetting.h"

@interface  UserSetting ()

@end

@implementation UserSetting

@synthesize leaderOpen = _leaderOpen;
@synthesize adViewOpen = _adViewOpen;
@synthesize drawerViewOpen = _drawerViewOpen;
@synthesize selfDefineTabBar = _selfDefineTabBar;

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


-(instancetype)initWithDefaultValue{
    self = [super init];
    if (self) {
        [self setprimaryDefaultValues];
    }
    return self;
}

//设置默认
-(void)setprimaryDefaultValues{
    self.leaderOpen = NO;
    self.adViewOpen = NO;
    self.drawerViewOpen = NO;
    self.selfDefineTabBar = NO;
}


#pragma mark - 设置

+(BOOL)firstLoadSetting{
    UserSetting *set = [[self alloc] init];
    [set setprimaryDefaultValues];
    return YES;
}


#pragma mark - set/get

-(void)setLeaderOpen:(BOOL)leaderOpen{
    _leaderOpen = leaderOpen;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:leaderOpen forKey:SETTING_LeaderOpen];
    [defaults synchronize];
}

-(BOOL)leaderOpen{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:SETTING_LeaderOpen];
}

-(void)setAdViewOpen:(BOOL)adViewOpen{
    _adViewOpen = adViewOpen;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:adViewOpen forKey:SETTING_adViewOpen];
    [defaults synchronize];
}

-(BOOL)adViewOpen{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:SETTING_adViewOpen];
}

-(void)setDrawerViewOpen:(BOOL)drawerViewOpen{
    _drawerViewOpen = drawerViewOpen;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:drawerViewOpen forKey:SETTING_drawerViewOpen];
    [defaults synchronize];
}

-(BOOL)drawerViewOpen{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:SETTING_drawerViewOpen];
}

-(void)setSelfDefineTabBar:(BOOL)selfDefineTabBar{
    _selfDefineTabBar = selfDefineTabBar;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:selfDefineTabBar forKey:SETTING_selfDefineTabBar];
    [defaults synchronize];
}

-(BOOL)selfDefineTabBar{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:SETTING_selfDefineTabBar];
}




@end
