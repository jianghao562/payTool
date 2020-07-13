//
//  WxPayModel.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHWxPayMode.h"
NS_ASSUME_NONNULL_BEGIN

@interface WxPayModel : NSObject<WxModel>
@property (nonatomic,copy) NSString *partnerId;
@property (nonatomic,copy) NSString *prepayId;
@property (nonatomic,copy) NSString *nonceStr;
@property (nonatomic,assign) UInt32 timeStamp;
@property (nonatomic,copy) NSString *package;
@property (nonatomic,copy) NSString *sign;
+(instancetype)payModelWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
