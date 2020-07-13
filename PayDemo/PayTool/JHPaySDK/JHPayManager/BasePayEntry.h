//
//  BasePayEntry.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PayDesignManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface BasePayEntry : NSObject

- (void)setAppKey:(NSString *)appKey universalLinks:(NSString *)universalLinks;

/**
 支付统一规范
 */

- (void)payWithModel:(id)model
          controller:(nullable UIViewController *)controller
          completion:(nullable JHCompletion)completion;
/**
 处理支付
 */
- (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(nullable NSString *)sourceApplication;

/**
 处理通用链接
 */
- (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity;

@end

NS_ASSUME_NONNULL_END
