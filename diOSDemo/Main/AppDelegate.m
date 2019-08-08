//
//  AppDelegate.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/7/31.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AttibuteOne.h"
#import "SingleOne.h"
#import "NSUserOne.h"
#import "DelegateOne.h"
#import "BlockOne.h"
#import "ObserverOne.h"
#import "ImageViewController.h"
#import "AudioViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //传值
//    AttibuteOne *rootView = [[AttibuteOne alloc] init];
//    SingleOne *rootView = [[SingleOne alloc] init];
//    NSUserOne *rootView = [[NSUserOne alloc] init];
//    DelegateOne *rootView = [[DelegateOne alloc] init];
//    BlockOne *rootView = [[BlockOne alloc] init];
//    ObserverOne *rootView = [[ObserverOne alloc] init];
    
    //多媒体入口
//    ImageViewController *rootView = [[ImageViewController alloc] init];
    AudioViewController *rootView = [[AudioViewController alloc] init];
    UINavigationController *navigator = [[UINavigationController alloc] initWithRootViewController:rootView];
    navigator.title = @"测试";
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navigator;
    [self.window makeKeyAndVisible];
    [[UIApplication sharedApplication] keyWindow].tintColor = [UIColor orangeColor];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
