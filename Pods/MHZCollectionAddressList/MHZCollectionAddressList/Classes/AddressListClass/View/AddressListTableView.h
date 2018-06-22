//
//  AddressListTableView.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/15.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressListTableView : UITableView

-(instancetype)initWithDidSelectedCellComplete:(void(^)(NSIndexPath *indexPath))block;

@end
