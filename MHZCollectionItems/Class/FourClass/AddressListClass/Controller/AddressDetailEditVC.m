//
//  AddressDetailEditVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressDetailEditVC.h"

@interface AddressDetailEditVC ()

@end

@implementation AddressDetailEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新建联系人";
    
    self.view.backgroundColor = [UIColor colorWith0xRGB:@"efefef" alpha:1.f];
    
    [self setupNavigationBar];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [super hideNavigationBarBottomLine];
    [super hideNavigationBarBgColor];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [super showNavigationBarBottomLine];
    [super showNavigationBarBgColor];
}


-(void)setupNavigationBar{
    [super setupLeftBtnIsCustom:NO withCustomBtn:nil ItemStyle:UIBarButtonItemStylePlain];
    
    [super setupRightBtnIsCustom:NO withCustomBtn:nil ItemStyle:UIBarButtonItemStylePlain];
}


@end
