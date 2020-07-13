//
//  BasePayEntry.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "BasePayEntry.h"

@implementation BasePayEntry
- (void)setAppKey:(NSString *)appKey universalLinks:(NSString *)universalLinks {
    
}
/**
 支付统一规范
 */

- (void)payWithModel:(id)model
          controller:(nullable UIViewController *)controller
          completion:(nullable JHCompletion)completion {
}
/**
 处理支付
 */
- (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication {
    return YES;
}

- (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity {
    return YES;
}
@end
