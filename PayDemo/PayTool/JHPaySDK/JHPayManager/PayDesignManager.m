//
//  PayDesignManager.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/13.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "PayDesignManager.h"
#import "JHMacros.h"
#import "AliModel.h"
#import "WxModel.h"
#import "BasePayEntry.h"

static NSString *const ALiPayChannelKey = @"AliPayEntry";
static NSString *const WxPayChannelKey = @"WxPayEntry";

@interface PayDesignManager()

@property (nonatomic, strong) NSMutableDictionary <NSString *, BasePayEntry *>*channelMap;
@property (nonatomic, strong) NSString *channel;
@property (nonatomic, weak) id<PayCompletionProtocol>delegate;

@end

@implementation PayDesignManager

+ (instancetype)shareInstance {
    static PayDesignManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self registerPayEntrys];
    }
    return self;
}

#pragma mark - public

- (void)registerWx:(NSString *)appid{
    [self.channelMap[WxPayChannelKey] setAppKey:appid universalLinks:@""];
}

- (void)registerWx:(NSString *)appid universalLinks:(NSString *)universalLinks {
    [self.channelMap[WxPayChannelKey] setAppKey:appid universalLinks:universalLinks];
}

- (void)addPayEntry:(BasePayEntry *)enrty {
    self.channelMap[NSStringFromClass([enrty class])] = enrty;
}

- (void)payWithEntryClass:(Class)cls
                     data:(id)data
               controller:(UIViewController *)controller
               completion:(JHCompletion)completion {
    self.channel = NSStringFromClass(cls);
    BasePayEntry *entry = self.channelMap[self.channel];
    if (entry == nil) {
        if (completion) {
            completion(ErrorStatusCodeChannelFail);
            JHLog(@"创建支付对象失败！！");
        }
        return;
    }
    [entry payWithModel:data controller:controller completion:completion];
}

- (void)payWithModel:(id)model
          controller:(UIViewController *)controller
          completion:(JHCompletion)completion {
    if ([model conformsToProtocol:@protocol(WxModel)]) {
        self.channel = WxPayChannelKey;
    }
    
    else if ([model conformsToProtocol:@protocol(AliModel)]) {
        self.channel = ALiPayChannelKey;
    }
    
    if (model == nil) {
        JHLog(@"支付参数获取失败失败！！");
        return;
    }
    
    BasePayEntry *entry = self.channelMap[self.channel];
    if (entry == nil) {
        if (completion) {
            completion(ErrorStatusCodeChannelFail);
            JHLog(@"创建支付对象失败！！");
        }
        return;
    }
    
    [entry payWithModel:model controller:controller completion:completion];
}


- (void)payWithModel:(id)model
          controller:(nullable UIViewController *)controller
            delegate:(id<PayCompletionProtocol>)delegate {
    self.delegate = delegate;
    [self payWithModel:model controller:controller completion:^(ErrorStatusCode code) {
        if ([self.delegate respondsToSelector:@selector(payManagerdidCompleteWithError:)]) {
            [self.delegate payManagerdidCompleteWithError:code];
        }
    }];
}

-(BOOL)handleOpenURL:(NSURL *)url sourceApplation:(NSString *)sourceApplation{
    BasePayEntry *entry = self.channelMap[self.channel];
    return [entry handleOpenURL:url sourceApplication:sourceApplation];;
}

- (BOOL)handleOpenUniversalLink:(NSUserActivity *)userActivity {
    BasePayEntry *entry = self.channelMap[self.channel];
    return [entry handleOpenUniversalLink:userActivity];
}

#pragma mark - private
- (void)registerPayEntrys {
    JHLog(@"ICPaySDK 创建Entry**************************");
    BasePayEntry *aliPay = [NSClassFromString(@"AliPayEntry") new];
    BasePayEntry *wxPay = [NSClassFromString(@"WxPayEntry") new];
    
    self.channelMap[ALiPayChannelKey] = aliPay;
    self.channelMap[WxPayChannelKey] = wxPay;
}



#pragma mark - getter

- (NSMutableDictionary *)channelMap {
    if (_channelMap == nil) {
        _channelMap = [NSMutableDictionary dictionary];
    }
    return _channelMap;
}



@end
