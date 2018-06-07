//
//  AddressListDetailVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressListDetailVC.h"

@interface AddressListDetailVC ()

@end

@implementation AddressListDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置导航栏背景图片为一个空的image，这样就透明了
    [self.navigationController.navigationBar hideWithAnimation:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //如果不想让其他页面的导航栏变为透明 需要重置
    [self.navigationController.navigationBar showWithAnimation:YES];
}

@end
