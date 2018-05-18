//
//  MFMDBObj.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/18.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFMDBObj : NSObject


/**
 打开数据库

 @param DBName 数据库名称
 @return 是否打开成功
 */
-(BOOL)openDataBaseWithName:(NSString *)DBName;


/**
 创建表

 @param firstObj 表字段
 @return 是否创建成功
 */
-(BOOL)createTabWithObjects:(NSString *)firstObj, ... NS_REQUIRES_NIL_TERMINATION;

@end
