//
//  TransferAnimatManager.h
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/28.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,AnimationType) {
    AnimationManagerPushType = 0,
};

@interface TransferAnimatManager : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType type;


-(instancetype)initWithType:(AnimationType)type;

@end
