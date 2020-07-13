//
//  AliModel.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//
#import <Foundation/Foundation.h>
@protocol AliModel <NSObject>
/**  白名单*/
- (NSString *)scheme;

/**
 支付宝签名
 */
- (NSString *)orderString;
@end
