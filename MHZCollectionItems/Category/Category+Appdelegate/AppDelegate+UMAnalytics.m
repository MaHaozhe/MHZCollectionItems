//
//  AppDelegate+UMAnalytics.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/25.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AppDelegate+UMAnalytics.h"
#import <UMCommon/UMCommon.h>
//由于好多页面可能都要用到点击事件的统计，<UMAnalytics/MobClick.h> 添加到了Header.h 当中了
//#import <UMAnalytics/MobClick.h>

@implementation AppDelegate (UMAnalytics)

-(void)UMAnalyticsApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [UMConfigure setEncryptEnabled:YES];//打开加密传输
    [UMConfigure setLogEnabled:YES];//设置打开日志
    [MobClick setCrashReportEnabled:NO];   // 关闭Crash收集
    [UMConfigure initWithAppkey:UMAnaAppID channel:@"App Store"];
    [MobClick event:@""];
}

@end
