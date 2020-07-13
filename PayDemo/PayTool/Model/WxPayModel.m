//
//  WxPayModel.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "WxPayModel.h"

@implementation WxPayModel
-(instancetype)initWxPayModelWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        _partnerId = dict[@"partnerId"];
        _prepayId = dict[@"prepayId"];
        _package = @"Sign=WXPay";
        _nonceStr= dict[@"noncestr"];
        NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
        _timeStamp = stamp.intValue;
        _sign = dict[@"sign"];
    }
    
  return self;
}

+(instancetype)payModelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWxPayModelWithDict:dict];
}

@end
