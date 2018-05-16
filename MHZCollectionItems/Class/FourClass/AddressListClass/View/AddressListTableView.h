//
//  AddressListTableView.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddressListTableViewDelegate <NSObject>

-(void)didSeletedCellActionWithIndexPath:(NSIndexPath *)indexPath complete:(void(^)(NSString* str))block;

@end

@interface AddressListTableView : UITableView

-(instancetype)initWithBlock:(void(^)(void))block;

@property (nonatomic, weak) id<AddressListTableViewDelegate> addressDelegate;

@end
