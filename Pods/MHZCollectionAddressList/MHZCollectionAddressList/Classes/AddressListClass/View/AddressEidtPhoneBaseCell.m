//
//  AddressEidtPhoneBaseCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/8.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEidtPhoneBaseCell.h"
#import "AddressEditPhoneAddTypeCell.h"
#import "AddressEditPhoneSubTypeCell.h"
#import "MHZCollectionAddressListHeader.h"


@interface AddressEidtPhoneBaseCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger cellNumbers;

@end

@implementation AddressEidtPhoneBaseCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = CLEARCOLOR;
    }
    return self;
}

-(void)setupTVCellNumbers:(NSInteger)cellNumbers{
    _cellNumbers = cellNumbers;
    [self setupSubviews];
}

-(void)setupSubviews{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = ADDRESSLIST_BACKGROUND_COLOR;
    [_tableView registerClass:[AddressEditPhoneAddTypeCell class] forCellReuseIdentifier:@"AddressEditPhoneAddTypeCell"];
    [_tableView registerClass:[AddressEditPhoneSubTypeCell class] forCellReuseIdentifier:@"AddressEditPhoneSubTypeCell"];
    _tableView.estimatedRowHeight = 100;
    _tableView.backgroundColor = CLEARCOLOR;
    [self.contentView addSubview:_tableView];
    
    kWeakSelf(self);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakself.contentView);
        make.height.equalTo(@(weakself.cellNumbers*50));
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressEditPhoneAddTypeCell" forIndexPath:indexPath];
    cell.backgroundColor = CLEARCOLOR;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
