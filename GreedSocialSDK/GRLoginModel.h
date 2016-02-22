//
//  GRLoginModel.h
//  Pods
//
//  Created by Bell on 16/2/22.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 登陆类型
 */
typedef NS_ENUM(NSInteger, GRLoginType) {
    GRLoginTypeQQ,
    GRLoginTypeWeiXin,
    GRLoginTypeWeiBo,
};

@interface GRLoginModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) GRLoginType loginType;

@end
