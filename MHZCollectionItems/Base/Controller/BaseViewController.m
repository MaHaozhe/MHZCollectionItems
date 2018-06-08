//
//  BaseViewController.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UIBarButtonItem *rightItem;
@property (nonatomic, strong) UIBarButtonItem *leftItem;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//添加左边按钮
-(void)setupLeftBtnIsCustom:(BOOL)isCustom withCustomBtn:(UIView *)customBtn ItemStyle:(UIBarButtonItemStyle)ItemStyle{
    if (isCustom) {
        [customBtn addTapWithTarget:self action:@selector(leftBtnClickAction)];
        _leftItem = [[UIBarButtonItem alloc] initWithCustomView:customBtn];
    }else{
        _leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:ItemStyle target:self action:@selector(leftBtnClickAction)];
    }
    
    self.navigationItem.leftBarButtonItem = _leftItem;
}


//添加右边按钮
-(void)setupRightBtnIsCustom:(BOOL)isCustom withCustomBtn:(UIView *)customBtn ItemStyle:(UIBarButtonItemStyle)ItemStyle{
    if (isCustom) {
        [customBtn addTapWithTarget:self action:@selector(leftBtnClickAction)];
        _rightItem = [[UIBarButtonItem alloc] initWithCustomView:customBtn];
    }else{
        _rightItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:ItemStyle target:self action:@selector(leftBtnClickAction)];
    }
    self.navigationItem.rightBarButtonItem = _rightItem;
}

-(void)leftBtnClickAction{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)rightBtnClickAction{
    
}

-(void)reSetRightBtnStyle:(NavigationBarButtonStyle)Style{
    switch (Style) {
        case NavigationBarButtonNormal:
        {
            [_rightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_leftItem.tintColor} forState:UIControlStateNormal];
        }
            break;
        case NavigationBarButtonSelected:
        {
            [_rightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:_leftItem.tintColor} forState:UIControlStateNormal];
        }
            break;
        case NavigationBarButtonDisabled:
        {
            [_rightItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWith0xRGB:@"808080" alpha:1.f]} forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}


-(void)showNavigationBarBottomLine{
    [self.navigationController.navigationBar setShadowImage:nil];
}

-(void)hideNavigationBarBottomLine{
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

-(void)showNavigationBarBgColor{
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

-(void)hideNavigationBarBgColor{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
}

-(void)setNavigationBarBgImageWithColor:(UIColor *)color{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
}
@end
