//
//  AppDelegate.m
//  FYYSP
//
//  Created by  chenfei on 16/9/29.
//  Copyright © 2016年 chenfei. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationController.h"
#import "ViewController.h"
#import "MainViewController.h"
#import "MainDrawerController.h"
#import "LeaderViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置引导页的停留时间
//    [NSThread sleepForTimeInterval:];
    //设置非导航栏状态下的状态栏状态，iOS9以后弃用，并且每一个UIViewController默认的状态栏状态为显示。所以可以不用显示，但安全起见放到rootVIewController里面再设置一下导航栏的状态
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    852156195
//    http://itunes.apple.com/cn/lookup?id=852156195
    
    //获取版本号
    [self requireVersionMessage];
    
    //设置根视图
    [self setRootViewController];
    
    //联网状态改变时调用的方法
    [self judgeTheReachAbility];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "MYCFITEM.FYYSP" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FYYSP" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"FYYSP.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - 功能模块
-(void)requireVersionMessage{
    
    [[CFNetworkingManager manager] GET:@"http://itunes.apple.com/cn/lookup?id=852156195" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    } showHUD:YES];
    
    
}

-(void)setRootViewController{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    if ([self appIsFirstLoading]) {
        //设置引导页
        [self showLeaderView];
    }else{
        //设置主界面
        [self enterMainViewController];
    }
    
    [self.window makeKeyAndVisible];
}


/**
 判断app版本是否是第一次登陆，并且做一些处理

 @return YES表示是第一次登陆，NO表示不是第一次登陆
 */
-(BOOL)appIsFirstLoading{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //获取版本唯一版本号
    NSString * versionAndBulid = [NSString stringWithFormat:@"Version&Bulid_%@_%@",appVersion,appBuild];
    NSLog(@"%@",versionAndBulid);
    if (![[userDefaults objectForKey:versionAndBulid] boolValue]) { //如果是第一次加载
        //删除老版本的信息存储，保存新版本的存储
        NSString *temVB = [userDefaults objectForKey:OlderVersionBulid];
        if (!kStringIsEmpty(temVB)) {
            [userDefaults removeObjectForKey:temVB];
            [userDefaults synchronize];
        }
        //版本更新后需要将新版本改成YES表示已经第一次加载过，并且设置oldVersion
        [userDefaults setBool:YES forKey:versionAndBulid];
        [userDefaults setObject:versionAndBulid forKey:OlderVersionBulid];
        [userDefaults synchronize];
        
        return YES;
    }else{
        return NO;
    }
}

/**
    设置引导页
 */
-(void)showLeaderView{
    LeaderViewController *leaderVC = [[LeaderViewController alloc]init];
    
    self.window.rootViewController = leaderVC;
}

/**
    设置主页面
 */
-(void)enterMainViewController{
    
<<<<<<< Updated upstream
    MainViewController *vc=[[MainViewController alloc]init];
//    MainDrawerController *vc = [[MainDrawerController alloc]init];
//    vc.drawerShowTableView = YES;

=======
//    MainViewController *vc=[[MainViewController alloc]init];
    MainDrawerController *vc = [[MainDrawerController alloc]init];
//    vc.drawerShowTableView = YES;
>>>>>>> Stashed changes
    self.window.rootViewController=vc;
}

/**
    判断网络状态
 */
-(void)judgeTheReachAbility{
    AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //        NSLog(@"Reachability:%@",AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"++没有网络+++");
            }break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"++wifi网络+++");
            }break;
            case AFNetworkReachabilityStatusUnknown:{
                NSLog(@"++未知网络+++");
            }break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"++wwan网络+++");
            }break;
            default:
                break;
        }
    }];

    [manager startMonitoring];
}




@end
