//
//  AddressDetailEditVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressDetailEditVC.h"
#import "AddressDetailEditTableView.h"


@interface AddressDetailEditVC ()

@property (nonatomic, strong) AddressDetailEditTableView *tableView;

@end

@implementation AddressDetailEditVC

#pragma mark
#pragma mark - 1.View生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"新建联系人";
    
    self.view.backgroundColor = ADDRESSLIST_BACKGROUND_COLOR;
    
    [self setupNavigationBar];
    
    [self setupSubviews];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [super hideNavigationBarBottomLine];
    [super setNavigationBarBgImageWithColor:ADDRESSLIST_BACKGROUND_COLOR];
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


-(void)setupSubviews{
    _tableView = [[AddressDetailEditTableView alloc] init];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}

#pragma mark
#pragma mark - 2.View代理、数据源方法


#pragma mark 自定义代理


#pragma mark
#pragma mark - 3.用户交互


#pragma mark
#pragma mark - 4.数据处理/Http

#pragma mark
#pragma mark - 5.其它
@end
