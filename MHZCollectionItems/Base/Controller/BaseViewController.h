//
//  BaseViewController.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NavigationBarButtonNormal,
    NavigationBarButtonSelected,
    NavigationBarButtonDisabled,
} NavigationBarButtonStyle;

@interface BaseViewController : UIViewController


/**
 设置导航左按钮

 @param isCustom 是否自定义
 @param customBtn 自定义按钮
 @param ItemStyle 按钮类型
 */
-(void)setupLeftBtnIsCustom:(BOOL)isCustom withCustomBtn:(UIView *)customBtn ItemStyle:(UIBarButtonItemStyle)ItemStyle;


/**
 设置导航右按钮

 @param isCustom 是否自定义
 @param customBtn 自定义按钮
 @param ItemStyle 按钮类型
 */
-(void)setupRightBtnIsCustom:(BOOL)isCustom withCustomBtn:(UIView *)customBtn ItemStyle:(UIBarButtonItemStyle)ItemStyle;


/**
 导航左按钮点击事件
 */
-(void)leftBtnClickAction;


/**
 导航右按钮点击事件
 */
-(void)rightBtnClickAction;


/**
 设置导航右按钮状态

 @param Style 按钮状态枚举值
 */
-(void)reSetRightBtnStyle:(NavigationBarButtonStyle)Style;


/**
 显示导航下边的黑线
 */
-(void)showNavigationBarBottomLine;


/**
 隐藏导航下边的黑线
 */
-(void)hideNavigationBarBottomLine;


/**
 显示导航的背景色
 */
-(void)showNavigationBarBgColor;


/**
 隐藏导航的背景色
 */
-(void)hideNavigationBarBgColor;

@end
