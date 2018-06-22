//
//  AddressEditPhoneCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/8.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEditPhoneAddTypeCell.h"
#import "MHZCollectionAddressListHeader.h"

@interface AddressEditPhoneAddTypeCell()

@property (nonatomic, strong) UIImageView *addIcon;
@property (nonatomic, strong) UILabel *addTitleLab;
@end

@implementation AddressEditPhoneAddTypeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    
    kWeakSelf(self);
    
    _addIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AddressList_Add_Icon"]];
    [self.contentView addSubview:_addIcon];
    
    _addTitleLab = [UILabel labelWithFrame:CGRectZero text:@"添加电话" font:[UIFont systemFontOfSize:15] textColor:BLACKCOLOR backGroundColor:CLEARCOLOR];
    [self.contentView addSubview:_addTitleLab];
    
    UIImageView *line = [[UIImageView alloc] init];
    line.backgroundColor = ADDRESSLIST_LINE_COLOR;
    [self.contentView addSubview:line];
    
    [_addIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.contentView.mas_left).offset(10);
        make.top.equalTo(weakself.contentView.mas_top).offset(10);
        make.bottom.equalTo(weakself.contentView.mas_bottom).offset(-10);
        make.height.width.equalTo(@(30));
    }];
    
    [_addTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.addIcon.mas_right).offset(10);
        make.top.bottom.equalTo(self.contentView);
        make.width.equalTo(@(130));
    }];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
    }];
}

@end
