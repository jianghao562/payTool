//
//  JHAliPayModel.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AliModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JHAliPayModel : NSObject<AliModel>
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSString *orderString;
@end

NS_ASSUME_NONNULL_END
