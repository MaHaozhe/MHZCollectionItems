//
//  AddressDetailEditTableView.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressDetailEditTableView.h"
#import "AddressEditHeadCell.h"

@interface AddressDetailEditTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation AddressDetailEditTableView

-(instancetype)init{
    if (self = [super init]) {
        [self setupSubviews];
    }
    return self;
}


-(void)setupSubviews{
    
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backgroundColor = [UIColor colorWith0xRGB:@"efefef" alpha:1.f];
    [self registerClass:[AddressEditHeadCell class] forCellReuseIdentifier:@"AddressEditHeadCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
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

@end
