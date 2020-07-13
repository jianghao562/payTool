//
//  ViewController.m
//  PayDemo
//
//  Created by Jiang Hao on 2020/7/1.
//  Copyright © 2020 jianghao. All rights reserved.
//

#import "ViewController.h"
#import "PayManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)onClickButton:(UIButton *)button{
    //微信
    if(button.tag==0){
        [PayManager wxPayWithURL:@"" params:@{} success:^(NSString * _Nullable message) {
            
        } failure:^(NSString * _Nullable message) {
            
        } cancel:^(NSString * _Nullable message) {
            
        }];
        
    }
    //支付宝
    else{
        
        
    }
    
}





@end
