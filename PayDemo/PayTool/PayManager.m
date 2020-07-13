//
//  PayManager.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "PayManager.h"
#import "JHPaySDK.h"
#import "ALiPayModel.h"
#import "WxPayModel.h"
@implementation PayManager

+ (void)aliPayWithURL:(NSString *)URL
               params:(NSDictionary *)params
              success:(payBlock)success
              failure:(payBlock)failure
               cancel:(payBlock)cancel {

                ALiPayModel *model = [ALiPayModel new];
                model.orderString = @"签名信息";
                [PayManager payWithModel:model controller:nil success:success failure:failure cancel:cancel];
     
}

+ (void)wxPayWithURL:(NSString *)URL
              params:(NSDictionary *)params
             success:(payBlock)success
             failure:(payBlock)failure
              cancel:(payBlock)cancel {


    NSDictionary *dic=@{@"partnerId":@"1585891821",
                        @"timeStamp":@"1594087633",
                        @"sign":@"3A6078513D5A9F56A1B746D4F47C52DE",
                        @"prepayId":@"wx0710071358662901eddcc9ec1550308200",
                        @"noncestr":@"pQwenYjZNSUP7gkloTxJ145dhBtKrFMW",
                        @"package":@"Sign=WXPay",
                        @"appid":@"wx4e31f025b5569a9c"};
            
           WxPayModel *model=[WxPayModel payModelWithDict:dic];

            [PayManager payWithModel: model controller:nil success:success failure:failure cancel:cancel];

}



+ (void)payWithModel:(id)model
           controller:(UIViewController *)controller
              success:(nonnull payBlock)success
              failure:(nonnull payBlock)failure
               cancel:(nonnull payBlock)cancel {
    [[PayDesignManager shareInstance] payWithModel:model controller:controller completion:^(ErrorStatusCode status) {
        //成功
        if (status == ErrorStatusCodeSuccess) {
        //退出
        }else if (status == ErrorStatusCodeUserCancel) {
            
        }else {
            
        }
        
    }];
}



@end
