//
//  AddressSearchBar.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "AddressSearchBar.h"

@interface AddressSearchBar()<UISearchBarDelegate>

@end


@implementation AddressSearchBar

-(instancetype)init{
    if (self = [super init]) {
        [self setupSearchBar];
    }
    return self;
}

-(void)setupSearchBar{
    self.placeholder = @"搜索";
    self.prompt = @" ";
    self.delegate =self;
    self.searchFieldBackgroundPositionAdjustment = UIOffsetMake(0, 20);
}

@end
