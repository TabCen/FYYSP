//
//  AppDelegate+notification_ios10.h
//  TestForNotificate
//
//  Created by FBI01 on 17/1/20.
//  Copyright © 2017年 CFTest. All rights reserved.
//

#import "AppDelegate.h"

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate (notification_ios10)<UNUserNotificationCenterDelegate>


/**
 申请推送权限
    注册推送通知第一步，在appdelegate didFinishLaunchingWithOptions：方法中调用，同时传入application
 @param application 传入application
 */
- (void)replyPushNotificationAuthorization:(UIApplication *)application;


/**
 应用程序在前台时，接受到远程通知消息时调用的方法
    远程推送
 @param info 推送消息
 */
-(void)receiveRemoteNotificationWhenAppForegroundWithInfo:(NSDictionary *)info;


/**
 应用程序在前台时，接收到本地推送消息时调用的方法

 @param info 本地通知消息
 */
-(void)receiveLocalNotificationWhenAppForegroundWithInfo:(NSDictionary *)info;


/**
 点击远程推送消息后作出的反应调用的函数

 @param info 推送消息
 */
-(void)didReceiveRemoteNotificationWithInfo:(NSDictionary *)info;


/**
 点击本地推送消息后作出反应调用的函数

 @param info 本地通知消息
 */
-(void)didReceiveLocalNotificationInfo:(NSDictionary *)info;


/**
 创建本地推送
 */
+ (void)createLocalizedUserNotification;




@end
