//
//  AddressEidtPhoneBaseCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/8.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEidtPhoneBaseCell.h"
//#import "AddressEditPhoneTypeTableView.h"
#import "AddressEditPhoneAddTypeCell.h"
#import "AddressEditPhoneSubTypeCell.h"


@interface AddressEidtPhoneBaseCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AddressEidtPhoneBaseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}



-(void)setupSubviews{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = ADDRESSLIST_BACKGROUND_COLOR;
    [_tableView registerClass:[AddressEditPhoneAddTypeCell class] forCellReuseIdentifier:@"AddressEditPhoneAddTypeCell"];
    [_tableView registerClass:[AddressEditPhoneSubTypeCell class] forCellReuseIdentifier:@"AddressEditPhoneSubTypeCell"];
    [self.contentView addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressEditPhoneAddTypeCell" forIndexPath:indexPath];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
