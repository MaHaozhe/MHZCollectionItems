//
//  AddressEditPhoneCell.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/8.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressEditPhoneAddTypeCell.h"

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
    
}

@end
