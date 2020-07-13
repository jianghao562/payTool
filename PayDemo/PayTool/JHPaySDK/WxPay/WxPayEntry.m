//
//  WxPayEntry.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "WxPayEntry.h"
#import <WXApi.h>
#import "WxModel.h"
#import "JHMacros.h"
@interface WxPayEntry ()<WXApiDelegate>
@property (nonatomic)JHCompletion completion;
@end
@implementation WxPayEntry

- (void)setAppKey:(NSString *)appKey universalLinks:(nonnull NSString *)universalLinks {
    if (appKey) {
        if (universalLinks.length==0) {
            universalLinks=@"https://help.wechat.com/sdksample/abc";
        }
        BOOL isSuccess = [WXApi registerApp:appKey universalLink:universalLinks];
        if (isSuccess) {
            JHLog(@"wechatPay sdk register success");
        }else {
            JHLog(@"wechatPay sdk register failure");
        }
    }
}

/**
 微信支付实现
 */
- (void)payWithModel:(id)model
          controller:(UIViewController *)controller
          completion:(JHCompletion)completion {
    self.completion = completion;
    if(![WXApi isWXAppInstalled]) {
        if (self.completion) {
            self.completion(ErrorStatusCodeUnsupported);
        }
        return;
    }

    id<WxModel> wxModel = model;
    PayReq *request = [[PayReq alloc] init];
    request.partnerId = [wxModel partnerId];
    request.prepayId= [wxModel prepayId];
    request.package = [wxModel package];//@"Sign=WXPay"
    request.nonceStr= [wxModel nonceStr];
    request.timeStamp = [wxModel timeStamp];
    request.sign= [wxModel sign];
    [WXApi sendReq:request completion:nil];
}

- (BOOL)handleOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication {
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity {
    return [WXApi handleOpenUniversalLink:userActivity delegate:self];
}

/**
 微信支付回调
 
 @param resp 具体的回应内容
 
 */
//WXSuccess           = 0,    /**< 成功    */
//WXErrCodeCommon     = -1,   /**< 普通错误类型    */
//WXErrCodeUserCancel = -2,   /**< 用户点击取消并返回    */
//WXErrCodeSentFail   = -3,   /**< 发送失败    */
//WXErrCodeAuthDeny   = -4,   /**< 授权失败    */
//WXErrCodeUnsupport  = -5,   /**< 微信不支持    */

- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[PayResp class]] && self.completion) {
        PayResp *response = (PayResp *)resp;
        switch (response.errCode) {
            case WXSuccess:
                self.completion(ErrorStatusCodeSuccess);
                break;
                
            case WXErrCodeUserCancel:
                self.completion(ErrorStatusCodeUserCancel);
                break;
                
            default:
                self.completion(ErrorStatusCodeFailure);
                break;
                
        }
        self.completion = nil;
    }
}

@end
