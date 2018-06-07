//
//  AddressEditHeadSubCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEditHeadSubCell.h"

@interface AddressEditHeadSubCell()

@property (nonatomic, strong) UITextField *titleTF;

@end

@implementation AddressEditHeadSubCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    
    _titleTF = [[UITextField alloc] init];
    _titleTF.textColor = [UIColor blackColor];
    _titleTF.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleTF];
    
    UIImageView *lineImgV = [[UIImageView alloc] init];
    lineImgV.backgroundColor = DEFAULT_LINE_COLOR;
    [self.contentView addSubview:lineImgV];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.contentView);
    }];
    
    [lineImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
    }];
}


-(void)setTitlePlaceholder:(NSString *)Placeholder{
    _titleTF.placeholder = Placeholder;
}

-(void)setTitleText:(NSString *)title{
    _titleTF.text = title;
}

@end
