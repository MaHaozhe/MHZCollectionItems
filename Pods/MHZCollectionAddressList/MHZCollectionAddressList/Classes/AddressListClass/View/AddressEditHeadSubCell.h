//
//  AddressEditHeadSubCell.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/6/7.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressEditHeadSubCell : UITableViewCell


/**
 设置内容

 @param title cell内容
 */
-(void)setTitleText:(NSString *)title;


/**
 设置站位字符

 @param Placeholder 站位字符
 */
-(void)setTitlePlaceholder:(NSString *)Placeholder;

@end
