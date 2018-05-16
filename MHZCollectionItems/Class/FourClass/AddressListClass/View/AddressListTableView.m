//
//  AddressListTableView.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressListTableView.h"

typedef void(^clickCellBlock)(NSIndexPath *indexPath);
@interface AddressListTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) clickCellBlock clickBlock;

@end

@implementation AddressListTableView

-(instancetype)initWithDidSelectedCellComplete:(void (^)(NSIndexPath *))block{
    if (self = [super init]) {
        [self setupTableview];
        if (block) {
            _clickBlock = block;
        }
    }
    return self;
}



-(void)setupTableview{
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor colorWith0xRGB:@"f8f8f8"];
    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
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
    _clickBlock(indexPath);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
