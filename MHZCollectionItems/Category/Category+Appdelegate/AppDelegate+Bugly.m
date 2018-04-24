//
//  AppDelegate+Bugly.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/24.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AppDelegate+Bugly.h"
#import <Bugly/Bugly.h>
#import <AvoidCrash/AvoidCrash.h>

@implementation AppDelegate (Bugly)


-(void)buglyApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Bugly startWithAppId:@"8a987576f6"];
    
    //开启防止崩溃功能
    [AvoidCrash makeAllEffective];
    
    //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dealwithCrashMessage:) name:AvoidCrashNotification object:nil];
}

- (void)dealwithCrashMessage:(NSNotification *)note {
    //注意:所有的信息都在userInfo中
    //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
    NSLog(@"%@",note.userInfo);
    NSException *exception = [NSException exceptionWithName:@"AvoidCrash" reason:[NSString stringWithFormat:@"崩溃名称：%@===崩溃原因：%@===崩溃代码方法位置：%@===框架内部解决方法：%@",[note.userInfo objectForKey:@"errorName"],[note.userInfo objectForKey:@"errorReason"],[note.userInfo objectForKey:@"errorPlace"],[note.userInfo objectForKey:@"defaultToDo"]] userInfo:note.userInfo];
    [Bugly reportException:exception];
}

@end
