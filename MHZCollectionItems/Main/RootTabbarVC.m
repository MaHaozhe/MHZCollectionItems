//
//  RootTabbarVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "RootTabbarVC.h"
#import "SpringVC.h"
#import "SummerVC.h"
#import "AutumnVC.h"
#import "WinterVC.h"
#import "BaseNavigationController.h"
#import "TransferAnimatManager.h"

@interface RootTabbarVC ()<UITabBarControllerDelegate>

@property (nonatomic, strong) UIImageView *itemBgImg;

@end

@implementation RootTabbarVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self.tabBar setTintColor:[UIColor whiteColor]];
    
    [self addTabBarShadow];
    
    [self setupTabbarController];
    
    [self loadItemBgImage];
}


-(void)loadItemBgImage{
    //添加蓝色的背景
    _itemBgImg = [[UIImageView alloc]init];
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    _itemBgImg.frame = CGRectMake(0, 0, w/4, 49);
    _itemBgImg.backgroundColor=[UIColor colorWith0xRGB:@"4a90e2"];
    [self.tabBar addSubview:_itemBgImg];
    [self.tabBar sendSubviewToBack:_itemBgImg];
}


//初始化tabbar
-(void)setupTabbarController{
    
    SpringVC *spingVC = [[SpringVC alloc] init];
    BaseNavigationController *springNav = [self loadItemWithTitle:@"春" normalIcon:@"order_normal" selectedIcon:@"order_selected" controller:spingVC];
    springNav.index = 0;
    [springNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    SummerVC *summerVC = [[SummerVC alloc] init];
    BaseNavigationController *summerNav = [self loadItemWithTitle:@"夏" normalIcon:@"produce_normal" selectedIcon:@"produce_selected" controller:summerVC];
    summerNav.index = 1;
    [summerNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    AutumnVC *autumnVC = [[AutumnVC alloc] init];
    BaseNavigationController *autumnNav = [self loadItemWithTitle:@"秋" normalIcon:@"message_normal" selectedIcon:@"message_selected" controller:autumnVC];
    autumnNav.index = 2;
    [autumnNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    WinterVC *winterVC = [[WinterVC alloc] init];
    BaseNavigationController *winterNav = [self loadItemWithTitle:@"冬" normalIcon:@"seting_normal" selectedIcon:@"setting_selected" controller:winterVC];
    winterNav.index = 3;
    [winterNav.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    self.viewControllers = @[springNav,summerNav,autumnNav,winterNav];
    
}


//格式化Item
-(BaseNavigationController *)loadItemWithTitle:(NSString *)title normalIcon:(NSString *)normalImgName selectedIcon:(NSString *)selectedImgName controller:(UIViewController *)controller{
    
    UIImage *ImageSel = [UIImage imageNamed:selectedImgName];
    ImageSel = [ImageSel imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *barItem = [[UITabBarItem alloc] init];
    barItem.selectedImage = ImageSel;
    barItem.image = [[UIImage imageNamed:normalImgName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    barItem.title=title;
    controller.tabBarItem = barItem;
    
    [barItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor colorWith0xRGB:@"4a90e2"], NSForegroundColorAttributeName,
                                     nil] forState:UIControlStateNormal];

    [barItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor whiteColor], NSForegroundColorAttributeName,
                                     nil] forState:UIControlStateSelected];
    
    BaseNavigationController *bNav = [[BaseNavigationController alloc] initWithRootViewController:controller];
    
    return bNav;
}


#pragma mark - 添加阴影
//添加阴影
-(void)addTabBarShadow{
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [self dropShadowWithOffset:CGSizeMake(0, 2)
                        radius:3
                         color:[UIColor blackColor]
                       opacity:0.3];
}


//设置阴影
- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    self.tabBar.clipsToBounds = NO;
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    NSInteger a = tabBarController.selectedIndex;
    _itemBgImg.frame = CGRectMake(a* w/4, 0, w/4, 49);
}

//添加动画
- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [[TransferAnimatManager alloc] init];
}

@end
