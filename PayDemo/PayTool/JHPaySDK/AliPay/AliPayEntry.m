//
//  AliPayEntry.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "AliPayEntry.h"
#import <AlipaySDK/AlipaySDK.h>
#import "PayDesignManager.h"
#import "AliModel.h"
@interface AliPayEntry ()
@property (nonatomic) JHCompletion completion;
@end
@implementation AliPayEntry

- (void)payWithModel:(id)model
          controller:(UIViewController *)controller
          completion:(JHCompletion)completion {
    
    self.completion = completion;
    id<AliModel> aliModel = model;
    [[AlipaySDK defaultService] payOrder:aliModel.orderString
                              fromScheme:aliModel.scheme
                                callback:^(NSDictionary *resultDic) {
                                    [self handleResult:resultDic];
                                }];
}


/**
 处理支付
 */
- (BOOL)handleOpenURL:(NSURL *)url
    sourceApplication:(nullable NSString *)sourceApplication {
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url
                                              standbyCallback:^(NSDictionary *resultDic) {
                                                  [self handleResult:resultDic];
                                              }];
    return YES;
}

/**
 处理支付回调 分析／解析
 
 @param result 结果集
 */
- (void)handleResult:(NSDictionary *)result {
    if (!self.completion) {
        return;
    }
    
    NSInteger code = [result[@"resultStatus"] integerValue];
    if (code == 9000) {
        self.completion(ErrorStatusCodeSuccess);
    }else if (code == 6001) {
        self.completion(ErrorStatusCodeUserCancel);
    }else {
        self.completion(ErrorStatusCodeFailure);
    }

    self.completion = nil;
}
/*
 resultStatus，状态码，SDK里没对应信息，第一个文档里有提到：
 9000 订单支付成功
 8000 正在处理中
 4000 订单支付失败
 6001 用户中途取消
 6002 网络连接出错
 memo， 提示信息，比如状态码为6001时，memo就是“用户中途取消”。但千万别完全依赖这个信息，如果未安装支付宝app，采用网页支付时，取消时状态码是6001，但这个memo是空的。。（当我发现这个问题的时候，我就决定，对于这么不靠谱的SDK，还是尽量靠自己吧。。）
 result，订单信息，以及签名验证信息。如果你不想做签名验证，那这个字段可以忽略了。。
 */



@end
