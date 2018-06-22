//
//  AddressListVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressListVC.h"
#import "AddressListTableView.h"
#import "AddressSearchBar.h"
#import "AddressListDetailVC.h"
#import "MFMDBObj.h"
#import "AddressDetailEditVC.h"
#import "MHZCollectionAddressListHeader.h"
@interface AddressListVC ()



@end

@implementation AddressListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通讯录";
    
    [self setupViews];
}

-(void)setupViews{
    //添加导航加号按钮
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addBtn addTarget:self action:@selector(navigationRightBtnAddAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    _searchBar = [[AddressSearchBar alloc] init];
    [self.view addSubview:_searchBar];
    
    __weak __typeof(self) weakSelf = self;
    AddressListTableView *tableview = [[AddressListTableView alloc] initWithDidSelectedCellComplete:^(NSIndexPath *indexPath) {
        AddressListDetailVC *detailVC = [[AddressListDetailVC alloc] init];
        [weakSelf.navigationController pushViewController:detailVC animated:YES];
    }];
    [self.view addSubview:tableview];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(@(Navigation_Status_Hight - 20));
        make.height.equalTo(@(76));
    }];
    
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.searchBar.mas_bottom);
    }];
}


#pragma mark - 交互事件
-(void)navigationRightBtnAddAction{
    AddressDetailEditVC *editVC = [[AddressDetailEditVC alloc] init];
    BaseNavigationController *navVC = [[BaseNavigationController alloc] initWithRootViewController:editVC];
    [self presentViewController:navVC animated:YES completion:nil];
}


@end
