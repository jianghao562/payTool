//
//  PayDesignManager.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 错误说明
 
 - PayStatusCodeUnkonwn: 未知
 - PayStatusCodeSuccess: 支付成功
 - PayStatusCodeFailure: 支付失败
 - PayStatusCodeUserCancel: 取消支付
 - PayStatusCodeUnsupported: 没有安装客户端
 - PayStatusCodeChannelFail: 支付渠道验证失败
 
 */
typedef NS_ENUM(NSInteger, ErrorStatusCode) {
    ErrorStatusCodeUnkonwn,
    ErrorStatusCodeSuccess,
    ErrorStatusCodeFailure,
    ErrorStatusCodeUserCancel,
    ErrorStatusCodeUnsupported,
    ErrorStatusCodeChannelFail
};

typedef void(^JHCompletion)(ErrorStatusCode);

@class BasePayEntry;
@protocol PayCompletionProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface PayDesignManager : NSObject

+ (instancetype)shareInstance;

/**
 注册微信sdk -scheme
 */
- (void)registerWx:(NSString *)appid;
/**
 注册微信sdk -universalLinks
 */
- (void)registerWx:(NSString *)appid universalLinks:(NSString *)universalLinks;

/*
 添加自定义支付对象
 */
- (void)addPayEntry:(BasePayEntry *)enrty;


/*
 使用自定义的支付方式支付
 */
- (void)payWithEntryClass:(Class)cls
                     data:(id)data
               controller:(UIViewController *)controller
               completion:(JHCompletion)completion;

/**
 支付统一API
 
 @param model 支付模型
 @param controller 银联支付为必要参数，其他为nil
 @param completion 完成回调
 */
- (void)payWithModel:(id)model
          controller:(nullable UIViewController *)controller
          completion:(nullable JHCompletion)completion;

- (void)payWithModel:(id)model
          controller:(nullable UIViewController *)controller
            delegate:(id<PayCompletionProtocol>)delegate;

/**
 支付回调 9.0前后统一调用此方法2222
 */
- (BOOL)handleOpenURL:(NSURL *)url
    sourceApplation:(nullable NSString*)sourceApplation;

/**
 使用通用链接回调
 */
- (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity;

@end

@protocol PayCompletionProtocol<NSObject>

@optional
- (void)payManagerdidCompleteWithError:(ErrorStatusCode)error;

@end

NS_ASSUME_NONNULL_END

