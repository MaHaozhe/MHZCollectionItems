//
//  AppDelegate+UMAnalytics.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/25.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AppDelegate.h"

static NSString *UMAnaAppID = @"f1fcc36a7a00fe6085c1697e";

@interface AppDelegate (UMAnalytics)

-(void)UMAnalyticsApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
