//
//  GRShareModel.h
//  Pods
//
//  Created by Bell on 16/2/22.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分享类型
 */
typedef NS_ENUM(NSInteger, GRShareType) {
    GRShareTypeQQ,          // QQ
    GRShareTypeQZone,       // QQ空间
    GRShareTypeWeiXin,      // 微信
    GRShareTypePengYouQuan, // 朋友圈
    GRShareTypeWeiBo,       // 微博
};

@interface GRShareModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) GRShareType shareType;

@end
