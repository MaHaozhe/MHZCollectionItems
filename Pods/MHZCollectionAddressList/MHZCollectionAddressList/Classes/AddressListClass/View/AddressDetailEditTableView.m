//
//  AddressDetailEditTableView.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressDetailEditTableView.h"
#import "AddressEditHeadCell.h"
#import "AddressEidtPhoneBaseCell.h"
#import "MHZCollectionAddressListHeader.h"
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
    self.backgroundColor = ADDRESSLIST_BACKGROUND_COLOR;
    self.estimatedRowHeight = 100;
    [self registerClass:[AddressEditHeadCell class] forCellReuseIdentifier:@"AddressEditHeadCell"];
    [self registerClass:[AddressEidtPhoneBaseCell class] forCellReuseIdentifier:@"AddressEidtPhoneBaseCell"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    switch (indexPath.row) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"AddressEditHeadCell" forIndexPath:indexPath];
        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"AddressEidtPhoneBaseCell" forIndexPath:indexPath];
            [(AddressEidtPhoneBaseCell *)cell setupTVCellNumbers:3];
        }
            break;
            
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
