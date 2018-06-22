//
//  AddressSearchBar.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressSearchBar.h"
#import "AddressListVC.h"
#import "MHZCollectionAddressListHeader.h"
@interface AddressSearchBar()<UISearchBarDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *maskLayer;
@property (nonatomic, strong) AddressListVC *listVC;

@end


@implementation AddressSearchBar

-(instancetype)init{
    if (self = [super init]) {
        [self setupSearchBar];
    }
    return self;
}

-(void)setupSearchBar{
    self.placeholder = @"搜索";
    self.prompt = @" ";
    self.delegate =self;
    self.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, 20);
    
}

-(void)setupMaskLayer{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMaskView)];
    
    UIViewController *currentVC = [Helper currentViewController];
    _listVC = (AddressListVC *)currentVC;
    _listVC.navigationItem.title = @"搜索";
    if (!_maskLayer) {
        _maskLayer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        _maskLayer.backgroundColor = [BLACKCOLOR colorWithAlphaComponent:0.2];
        [_maskLayer addGestureRecognizer:tap];
    }
    
    [_listVC.navigationController setNavigationBarHidden:YES animated:YES];
    kWeakSelf(self);
    [UIView animateWithDuration:.3f animations:^{
        
        [weakself.listVC.searchBar mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakself.listVC.view);
            make.top.equalTo(@(0));
            make.height.equalTo(@(76));
        }];
        [weakself.listVC.view layoutIfNeeded];
        [weakself.listVC.view addSubview:weakself.maskLayer];
    }];
    [_listVC.view bringSubviewToFront:_listVC.searchBar];
    
}

#pragma mark - 交互
-(void)hideMaskView{
    _listVC.navigationItem.title = @"通讯录";
    
    [_listVC.view endEditing:YES];
    [_listVC.navigationController setNavigationBarHidden:NO animated:YES];
    kWeakSelf(self);
    [UIView animateWithDuration:.3f animations:^{
        [weakself.listVC.searchBar mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(weakself.listVC.view);
            make.top.equalTo(@(weakself.listVC.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height - 20));
            make.height.equalTo(@(76));
        }];
        [self.listVC.view layoutIfNeeded];
        [weakself.maskLayer removeFromSuperview];
    }];
}

#pragma mark - searchBar代理方法
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    [self setupMaskLayer];
    return YES;
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    [searchBar setShowsCancelButton:YES animated:YES]; // 动画显示取消按钮
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES]; // 动画隐藏取消按钮
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self hideMaskView];
}

@end
