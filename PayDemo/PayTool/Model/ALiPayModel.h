//
//  ALiPayModel.h
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JHAliPayModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ALiPayModel : NSObject<AliModel>
@property (nonatomic) NSString *orderString;
@property (nonatomic) NSString *scheme;
@end

NS_ASSUME_NONNULL_END
