//
//  MFMDBObj.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/5/18.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "MFMDBObj.h"
#import <FMDB/FMDB.h>

@implementation MFMDBObj
-(BOOL)openDataBaseWithName:(NSString *)DBName{
    
    
    
    return YES;
}

-(BOOL)createTabWithObjects:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION{
    
    NSMutableArray* arrays = [NSMutableArray array];
    va_list argList;
    if (firstObj) {
        [arrays addObject:firstObj];
        va_start(argList, firstObj);
        id temp;
        while ((temp = va_arg(argList, id))) {
            [arrays addObject:temp];
            
        }
    }
    va_end(argList);
    
    return YES;
}
@end
