//
//  AppDelegate+notification_ios10.m
//  TestForNotificate
//
//  Created by FBI01 on 17/1/20.
//  Copyright © 2017年 CFTest. All rights reserved.
//

#import "AppDelegate+notification_ios10.h"
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@implementation AppDelegate (notification_ios10)

#pragma mark - 申请通知权限
    // 申请通知权限
- (void)replyPushNotificationAuthorization:(UIApplication *)application{

    if (IOS10_OR_LATER) {
            //iOS 10 later
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            //必须写代理，不然无法监听通知的接收与点击事件
        center.delegate = self;

        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (!error && granted) {
                    //用户点击允许
                NSLog(@"允许通知消息");
            }else{
                    //用户点击不允许
                NSLog(@"不允许通知消息");
            }
        }];

            //获取用户对通知的设置
        [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                //            NSLog(@"用户对应用通知的设置>>>>>>>>>>>>%@",settings);
        }];

    }else if (IOS8_OR_LATER){
            //iOS 8 - iOS 10系统
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }else{
            //iOS 8.0系统以下
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound];
    }

        //注册远端消息通知获取device token
    [application registerForRemoteNotifications];
}


#pragma  mark - 获取device Token
    //获取DeviceToken成功
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
        //正确写法
    NSString *deviceString = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    deviceString = [deviceString stringByReplacingOccurrencesOfString:@" " withString:@""];

    NSLog(@"deviceToken===========%@",deviceString);
}

    //获取DeviceToken失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    NSLog(@"[DeviceToken Error]:%@\n",error.description);
}


#pragma mark - iOS10 收到通知（本地和远端） UNUserNotificationCenterDelegate

    //app在前台时接受通知时
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
        //收到推送的请求
    UNNotificationRequest *request = notification.request;
        //收到推送的内容
    UNNotificationContent *content = request.content;
        //收到用户的基本信息
    NSDictionary *userInfo = content.userInfo;
//        //收到推送消息的角标
//    NSNumber *badge = content.badge;
//        //收到推送消息body
//    NSString *body = content.body;
//        //推送消息的声音
//    UNNotificationSound *sound = content.sound;
//        // 推送消息的副标题
//    NSString *subtitle = content.subtitle;
//        // 推送消息的标题
//    NSString *title = content.title;

        //判断是否是本地通知 这里是远处通知
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            ///此处省略一万行需求代码。。。。。。
        NSLog(@"iOS10 应用在前台时收到远程通知:%@",userInfo);

        if ([self respondsToSelector:@selector(receiveRemoteNotificationWhenAppForegroundWithInfo:)]) {
            [self receiveRemoteNotificationWhenAppForegroundWithInfo:userInfo];
        }

    }else {
            // 判断为本地通知
            ///此处省略一万行需求代码。。。。。。
        if ([self respondsToSelector:@selector(receiveLocalNotificationWhenAppForegroundWithInfo:)]) {
            [self receiveLocalNotificationWhenAppForegroundWithInfo:userInfo];
        }
    }

        // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
    completionHandler(
                      UNNotificationPresentationOptionBadge|
                      UNNotificationPresentationOptionSound|
                      UNNotificationPresentationOptionAlert
                      );

}

    //点击消息后的操作
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
        //收到推送的请求
    UNNotificationRequest *request = response.notification.request;
        //收到推送的内容
    UNNotificationContent *content = request.content;
        //收到用户的基本信息
    NSDictionary *userInfo = content.userInfo;
//        //收到推送消息的角标
//    NSNumber *badge = content.badge;
//        //收到推送消息body
//    NSString *body = content.body;
//        //推送消息的声音
//    UNNotificationSound *sound = content.sound;
//        // 推送消息的副标题
//    NSString *subtitle = content.subtitle;
//        // 推送消息的标题
//    NSString *title = content.title;

    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        NSLog(@"iOS10 点击推送消息后调用 :%@",userInfo);
            ///此处省略一万行需求代码。。。。。。
        if ([self respondsToSelector:@selector(didReceiveRemoteNotificationWithInfo:)]) {
            [self didReceiveRemoteNotificationWithInfo:userInfo];
        }
    }else {
            // 判断为本地通知
            ///此处省略一万行需求代码。。。。。。
        if ([self respondsToSelector:@selector(didReceiveLocalNotificationInfo:)]) {
            [self didReceiveLocalNotificationInfo:userInfo];
        }
    }

    completionHandler(); // 系统要求执行这个方法

}

#pragma mark -适配iOS 10之前收到通知

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"iOS6及以下系统，收到通知:%@", userInfo);
        ///此处省略一万行需求代码。。。。。。
    if ([self respondsToSelector:@selector(didReceiveRemoteNotificationWithInfo:)]) {
        [self didReceiveRemoteNotificationWithInfo:userInfo];
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"iOS7及以上系统，收到通知:%@", userInfo);
    completionHandler(UIBackgroundFetchResultNewData);
        ///此处省略一万行需求代码。。。。。。
    
    if ([self respondsToSelector:@selector(didReceiveRemoteNotificationWithInfo:)]) {
        [self didReceiveRemoteNotificationWithInfo:userInfo];
    }
}


-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    NSDictionary *userInfo = notification.userInfo;
    
    if ([self respondsToSelector:@selector(didReceiveLocalNotificationInfo:)]) {
        [self didReceiveLocalNotificationInfo:userInfo];
    }
}


//定时推送
+ (void)createLocalizedUserNotification{
    
    // 设置触发条件 UNNotificationTrigger
    UNTimeIntervalNotificationTrigger *timeTrigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:10.0f repeats:NO];
    
    // 创建通知内容 UNMutableNotificationContent, 注意不是 UNNotificationContent ,此对象为不可变对象。
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"Dely 时间提醒 - title";
    content.subtitle = [NSString stringWithFormat:@"Dely 装逼大会竞选时间提醒 - subtitle"];
    content.body = @"Dely 装逼大会总决赛时间到，欢迎你参加总决赛！希望你一统X界 - body";
    content.badge = @666;
    content.sound = [UNNotificationSound defaultSound];
    content.userInfo = @{@"key1":@"value1",@"key2":@"value2"};
    
    // 创建通知标示
    NSString *requestIdentifier = @"Dely.X.time";
    
    // 创建通知请求 UNNotificationRequest 将触发条件和通知内容添加到请求中
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier content:content trigger:timeTrigger];
    
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    // 将通知请求 add 到 UNUserNotificationCenter
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"推送已添加成功 %@", requestIdentifier);
            //你自己的需求例如下面：
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancelAction];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
            //此处省略一万行需求。。。。
        }
    }];
    
}



@end
