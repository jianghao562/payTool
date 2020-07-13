//
//  AppDelegate.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "AppDelegate.h"
#import "JHPaySDK.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[PayDesignManager shareInstance] registerWx:@"wx4e31f025b5569a9c"];
    
    return YES;
}

/*-------------支付处理回调------------*/

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
  return  [[PayDesignManager shareInstance] handleOpenURL:url sourceApplation:nil];

}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler {
    return [[PayDesignManager shareInstance] handleOpenUniversalLink:userActivity];
}

@end
