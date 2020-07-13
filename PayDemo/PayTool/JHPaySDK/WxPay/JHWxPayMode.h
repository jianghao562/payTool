//
//  JHWxPayMode.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WxModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHWxPayMode : NSObject<WxModel>
@property (nonatomic) NSString *partnerId;
@property (nonatomic) NSString *prepayId;
@property (nonatomic) NSString *nonceStr;
@property (nonatomic) UInt32 timeStamp;
@property (nonatomic) NSString *package;
@property (nonatomic) NSString *sign;
@end

NS_ASSUME_NONNULL_END
