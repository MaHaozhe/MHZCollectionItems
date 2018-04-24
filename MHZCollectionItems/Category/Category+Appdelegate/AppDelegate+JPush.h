//
//  AppDelegate+JPush.h
//  HachiBusiness
//
//  Created by apple on 2017/11/13.
//  Copyright © 2017年 王水平. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"

static NSString *appKey = @"f1fcc36a7a00fe6085c1697e";
static NSString *channel = @"App Store";

#ifdef DEBUG
static BOOL isProduction = FALSE;
#else
static BOOL isProduction = true;
#endif

@interface AppDelegate (JPush)<JPUSHRegisterDelegate>

-(void)jPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
