//
//  CTMediator+MHZCollectionFourClassMadiator.m
//  Pods
//
//  Created by MaHaoZhe on 2018/6/22.
//

#import "CTMediator+MHZCollectionFourClassMadiator.h"

@implementation CTMediator (MHZCollectionFourClassMadiator)

-(UIViewController *)Mediator_GetAddressListVC{
    UIViewController *addressListVC = [self performTarget:@"AddressListAction" action:@"nativeFetchAddressListVC" params:nil shouldCacheTarget:NO];
    return addressListVC;
}

@end
