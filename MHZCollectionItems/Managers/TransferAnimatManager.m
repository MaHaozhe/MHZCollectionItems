//
//  TransferAnimatManager.m
//  MHZCollectionItems
//
//  Created by MaHaoZhe on 2018/4/28.
//  Copyright © 2018年 HachiTech. All rights reserved.
//

#import "TransferAnimatManager.h"
#import "BaseNavigationController.h"

@implementation TransferAnimatManager

-(instancetype)initWithType:(AnimationType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}


- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    //获取fromvc 和 tovc
    BaseNavigationController *fromVC = (BaseNavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    BaseNavigationController *toVC = (BaseNavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    //转场环境
    UIView *containView = [transitionContext containerView];
    containView.backgroundColor = [UIColor whiteColor];
    
    //判断滑动方向
    if (toVC.index > fromVC.index) {
        toView.frame = CGRectMake(KScreenWidth, 0, containView.frame.size.width, containView.frame.size.height);
        [containView addSubview:toView];
        //动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.transform = CGAffineTransformTranslate(fromView.transform, -KScreenWidth, 0);
            toView.transform = CGAffineTransformTranslate(toView.transform, -KScreenWidth, 0);
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }else{
        toView.frame = CGRectMake(-KScreenWidth, 0, containView.frame.size.width, containView.frame.size.height);
        [containView addSubview:toView];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.transform = CGAffineTransformTranslate(fromView.transform, KScreenWidth, 0);
            toView.transform = CGAffineTransformTranslate(toView.transform, KScreenWidth, 0);
        } completion:^(BOOL finished) {
            [fromView removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
    
}

@end
