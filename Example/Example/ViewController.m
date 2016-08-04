//
//  ViewController.m
//  Example
//
//  Created by Bell on 16/2/22.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "ViewController.h"
#import <GreedSocialSDK/GreedSocialSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[GRSocial getInstance] registerWeiXinWithAppId:@"WeiXinAppId" description:@"GreedSocialSDK"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
