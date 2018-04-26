//
//  AppDelegate+ThirdPort.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AppDelegate+ThirdPort.h"
#import "AppDelegate+JPush.h"
#import "AppDelegate+Bugly.h"
#import "AppDelegate+UMAnalytics.h"

@implementation AppDelegate (ThirdPort)

-(void)ThirdPortApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    //bugly
    [self buglyApplication:application didFinishLaunchingWithOptions:launchOptions];
    //jPush
    [self jPushApplication:application didFinishLaunchingWithOptions:launchOptions];
    //UMAnalytics
    [self UMAnalyticsApplication:application didFinishLaunchingWithOptions:launchOptions];
}

@end
