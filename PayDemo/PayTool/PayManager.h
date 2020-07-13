//
//  PayManager.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^payBlock)(NSString * _Nullable message);

@interface PayManager : NSObject

//微信支付
+ (void)wxPayWithURL:(NSString *)URL
              params:(NSDictionary *)params
             success:(payBlock)success
             failure:(payBlock)failure
              cancel:(payBlock)cancel;


//支付宝支付
+ (void)aliPayWithURL:(NSString *)URL
               params:(NSDictionary *)params
              success:(payBlock)success
              failure:(payBlock)failure
               cancel:(payBlock)cancel;




@end

NS_ASSUME_NONNULL_END
