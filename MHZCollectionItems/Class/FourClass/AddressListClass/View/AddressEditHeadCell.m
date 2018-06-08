//
//  AddressEditHeadCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEditHeadCell.h"
#import "AddressEditHeadSubCell.h"

@interface AddressEditHeadCell()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *headImgView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AddressEditHeadCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}


-(void)setupSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    
    _headImgView = [[UIImageView alloc] init];
    _headImgView.backgroundColor = [UIColor colorWith0xRGB:@"e1e1e1"];
    _headImgView.layer.cornerRadius = 25;
    _headImgView.layer.borderWidth = 1;
    _headImgView.layer.borderColor = [UIColor whiteColor].CGColor;
    _headImgView.layer.masksToBounds = YES;
    [self addSubview:_headImgView];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = ADDRESSLIST_BACKGROUND_COLOR;
    _tableView.estimatedRowHeight = 100;
    [_tableView registerClass:[AddressEditHeadSubCell class] forCellReuseIdentifier:@"AddressEditHeadSubCell"];
    [self addSubview:_tableView];
    
    
    
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.top.equalTo(self.mas_top).offset(5);
        make.width.height.equalTo(@(50));
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(3*50 + 20));
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AddressEditHeadSubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddressEditHeadSubCell" forIndexPath:indexPath];
    
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
