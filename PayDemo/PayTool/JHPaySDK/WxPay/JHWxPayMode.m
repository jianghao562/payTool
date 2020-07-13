//
//  JHWxPayMode.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "JHWxPayMode.h"

@implementation JHWxPayMode

/** 商家向财付通申请的商家id */
- (NSString *)partnerId {
    return _partnerId;
}

/** 预支付订单 */
- (NSString *)prepayId {
    return _prepayId;
}

/** 随机串，防重发 */
- (NSString *)nonceStr {
    return _nonceStr;
}

/** 时间戳，防重发 */
- (UInt32)timeStamp {
    return _timeStamp;
}

/** 商家根据财付通文档填写的数据和签名 */
- (NSString *)package {
    return _package;
}

/** 商家根据微信开放平台文档对数据做的签名 */
- (NSString *)sign {
    return _sign;
}
@end
