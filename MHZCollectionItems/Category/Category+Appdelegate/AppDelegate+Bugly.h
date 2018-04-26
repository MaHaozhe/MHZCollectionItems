//
//  AppDelegate+Bugly.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/24.
//  Copyright © 2018年 HachiTech. All rights reserved.
//  腾讯Bugly即成

#import "AppDelegate.h"

static NSString *buglyAppID = @"f1fcc36a7a00fe6085c1697e";
@interface AppDelegate (Bugly)


-(void)buglyApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


@end
