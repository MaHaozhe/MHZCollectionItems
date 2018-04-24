//
//  AppDelegate+JPush.m
//  HachiBusiness
//
//  Created by apple on 2017/11/13.
//  Copyright © 2017年 王水平. All rights reserved.
//

#import "AppDelegate+JPush.h"
#import <AdSupport/AdSupport.h>
#import <UserNotifications/UserNotifications.h>

#define NSFoundationVersionNumber_iOS_9_x_Max 1299

@implementation AppDelegate (JPush)

-(void)jPushApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    [self initSDKWithOpeions:launchOptions];
    
    [self registerEntity];
    
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    
    /*
     自定义消息
     [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
     */
    
    [self setupNotifiers];
}

/**
 这个是自定义消息，防止多人登陆都收到消息

 @param notification 通知内容
 */
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSString *content = [userInfo valueForKey:@"content"];
    NSDictionary *extras = [userInfo valueForKey:@"extras"];
    NSString *customizeField1 = [extras valueForKey:@"customizeField1"]; //服务端传递的Extras附加字段，key是自己定义的
    NSLog(@"%@",userInfo);
    NSLog(@"%@",content);
    NSLog(@"%@",extras);
    NSLog(@"%@",customizeField1);
    
    UILocalNotification * Notification=[[UILocalNotification alloc] init];
    //设置开始时间
    NSDate *fireDate = [[NSDate date] dateByAddingTimeInterval:1];
    Notification.fireDate = fireDate;
    //设置body
    Notification.alertBody = content;
    
    //设置action
    Notification.alertAction=@"详情";
    //传递额外信息
    Notification.userInfo = userInfo;
    
    //设置闹铃
    //注册完之后如果不删除，下次会继续存在，即使从模拟器卸载掉也会保留
    //注册通知
    [[UIApplication sharedApplication] scheduleLocalNotification:Notification];
}


//注册通知
-(void)registerEntity{
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        //可以添加自定义categories
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            if (@available(iOS 10.0, *)) {
                NSSet<UNNotificationCategory *> *categories;
                entity.categories = categories;
            } else {
                // Fallback on earlier versions
            }
        }
        else {
            NSSet<UIUserNotificationCategory *> *categories;
            entity.categories = categories;
        }
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
}

//初始化SDK
-(void)initSDKWithOpeions:(NSDictionary *)launchOptions{
    //如不需要使用IDFA，advertisingIdentifier 可为nil
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
    
    //2.1.9版本新增获取registration id block接口。
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
            
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
}

// 监听系统生命周期回调，做一些必要的操作
- (void)setupNotifiers{
    //程序进入后台时调用。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidEnterBackgroundNotif:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    //程序进入前台，但是还没有处于活动状态时调用。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
    
    //程序启动并进行初始化的时候。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidFinishLaunching:)
                                                 name:UIApplicationDidFinishLaunchingNotification
                                               object:nil];
    
    //程序进入前台并处于活动状态时调用。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidBecomeActiveNotif:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    //从活动状态进入非活动状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillResignActiveNotif:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    //内存警告通知。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appDidReceiveMemoryWarning:)
                                                 name:UIApplicationDidReceiveMemoryWarningNotification
                                               object:nil];
    //程序被杀死时调用。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appWillTerminateNotif:)
                                                 name:UIApplicationWillTerminateNotification
                                               object:nil];
    //当被保护的文件进入不活跃状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appProtectedDataWillBecomeUnavailableNotif:)
                                                 name:UIApplicationProtectedDataWillBecomeUnavailable
                                               object:nil];
    //但受保护的文件进入活跃状态
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appProtectedDataDidBecomeAvailableNotif:)
                                                 name:UIApplicationProtectedDataDidBecomeAvailable
                                               object:nil];
}

#pragma mark - notifiers
- (void)appDidEnterBackgroundNotif:(NSNotification*)notif{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [JPUSHService setBadge:0];
}

- (void)appWillEnterForeground:(NSNotification*)notif
{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [JPUSHService setBadge:0];
}

- (void)appDidFinishLaunching:(NSNotification*)notif
{
    
}

- (void)appDidBecomeActiveNotif:(NSNotification*)notif
{
    
}

- (void)appWillResignActiveNotif:(NSNotification*)notif
{
    
}

- (void)appDidReceiveMemoryWarning:(NSNotification*)notif
{
    
}

- (void)appWillTerminateNotif:(NSNotification*)notif
{
    
}

- (void)appProtectedDataWillBecomeUnavailableNotif:(NSNotification*)notif
{
    
}

- (void)appProtectedDataDidBecomeAvailableNotif:(NSNotification*)notif
{
    
}

//获取token
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [JPUSHService registerDeviceToken:deviceToken];
}

#pragma mark - iOS6及以下系统，收到通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
    
}


#pragma mark - iOS7及以上系统，收到通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler {
    [JPUSHService handleRemoteNotification:userInfo];
    
//    [self getNotificationTurnPageWithMessageDic:tempDic];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    [JPUSHService showLocalNotificationAtFront:notification identifierKey:nil];
}

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#pragma mark- JPUSHRegisterDelegate
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    
    NSDictionary * userInfo = notification.request.content.userInfo;
    //前台收到推送时触发（1）
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
        
    }else{
        // 判断为本地通知
    }
    
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
    
    //收到推送发送通知，通知消息页面刷新数据
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshMessagePageData" object:nil];
    
}

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    //前台收到推送后点击推送触发的方法（2）
    //在后台收到推送，点击推送触发 （3）
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
//        [self getNotificationTurnPageWithMessageDic:tempDic];
    }else{
        // 判断为本地通知
    }
    completionHandler();  // 系统要求执行这个方法
}
#endif


#pragma mark - 点击通知的跳转
#pragma mark - 跳转 1->配送提醒 2->新订单提醒 3->售罄提醒
-(void)getNotificationTurnPageWithMessageDic:(NSDictionary *)messageDic{
    /*
     if ([[messageDic objectForKey:@"messageType"] integerValue] == 1 || [[messageDic objectForKey:@"messageType"] integerValue] == 2) {
     HomeOrderDetailsController *odVC = [[HomeOrderDetailsController alloc] init];
     
     id obj = [UIApplication sharedApplication].keyWindow.rootViewController;
     
     UINavigationController* nav;
     
     if ([obj isKindOfClass:[MainTabBarController class]]) {
     MainTabBarController* bar = obj;
     nav = bar.selectedViewController;
     odVC.orderType = [messageDic objectForKey:@"orderType"];
     odVC.orderID = [messageDic objectForKey:@"orderID"];
     odVC.hidesBottomBarWhenPushed = YES;
     odVC.state = ^(NSString *state) {};
     [nav pushViewController:odVC animated:YES];
     }
     
     }else if ([[messageDic objectForKey:@"messageType"] integerValue] == 3){
     //跳往编辑页面
     
     
     id obj = [UIApplication sharedApplication].keyWindow.rootViewController;
     
     UINavigationController* nav;
     if ([obj isKindOfClass:[MainTabBarController class]]) {
     MainTabBarController* bar = obj;
     nav = bar.selectedViewController;
     EditCommodityController *vc = [[EditCommodityController alloc] init];
     vc.produceCommodityID = [messageDic objectForKey:@"prodID"];
     if ([[messageDic objectForKey:@"prodMode"] integerValue] == 0) {//商品
     vc.editmanagerType = editProductManagerType;
     }else if ([[messageDic objectForKey:@"prodMode"] integerValue] == 1){//服务
     vc.editmanagerType = editServiceManagerType;
     }
     [nav pushViewController:vc animated:YES];
     }
     
     }
     */
    
}


- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

@end
