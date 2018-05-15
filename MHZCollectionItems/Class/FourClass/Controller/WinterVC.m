//
//  WinterVC.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/26.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "WinterVC.h"
#import "PaymentVC.h"

@interface WinterVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;//功能列表

@end

@implementation WinterVC

#pragma mark
#pragma mark - 1.View生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"冬";
    
    [self setupSubviews];
    
}


-(void)setupSubviews{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor colorWith0xRGB:@"f8f8f8"];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
}


#pragma mark
#pragma mark - 2.View代理、数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        PaymentVC *payVC = [[PaymentVC alloc] init];
        [self.navigationController pushViewController:payVC animated:YES];
    }
}


#pragma mark 自定义代理
-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] initWithArray:@[@"支付",@"通讯录"]];
    }
    return _dataArr;
}

#pragma mark
#pragma mark - 3.用户交互


#pragma mark
#pragma mark - 4.数据处理/Http

#pragma mark
#pragma mark - 5.其它






@end
