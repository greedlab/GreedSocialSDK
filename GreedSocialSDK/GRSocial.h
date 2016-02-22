//
//  GRSocial.h
//  Pods
//
//  Created by Bell on 16/2/22.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/QQApiInterface.h>

#import "WeiboSDK.h"
#import "WXApi.h"
#import "WXApiObject.h"

#import "GRShareModel.h"
#import "GRLoginModel.h"

@protocol GRSocialDelegate <NSObject>

@optional

// login

- (void)didQQLoginSuccess:(TencentOAuth*)tencentOAuth sender:(id)sender;
- (void)didWeiBoLoginSuccess:(WBAuthorizeResponse*)response sender:(id)sender;
- (void)didWeiXinLoginSuccess:(SendAuthResp*)resp sender:(id)sender;

// share

- (void)didQQShareSuccess:(QQBaseResp*)resp sender:(id)sender;
- (void)didWeiBoShareSuccess:(WBSendMessageToWeiboResponse*)response sender:(id)sender;

/**
 *  微信分享成功
 *
 *  @param resp   resp
 *  @param sender GRSocial
 */
- (void)didWeiXinShareSuccess:(BaseResp*)resp sender:(id)sender;

/**
 *  朋友圈分享成功
 *
 *  @param resp   resp
 *  @param sender GRSocial
 */
- (void)didPengYouQuanShareSuccess:(BaseResp*)resp sender:(id)sender;

@end

@interface GRSocial : NSObject
<TencentLoginDelegate
,WeiboSDKDelegate
,QQApiInterfaceDelegate
,WXApiDelegate
,TencentSessionDelegate>

@property(nonatomic,strong)TencentOAuth* tencentOAuth;

@property(nonatomic,assign)GRShareType shareType;
@property(nonatomic,assign)GRLoginType loginType;
@property(nonatomic,assign,getter=isLogin)BOOL login;  // 是否为第三方登陆

@property(nonatomic,assign)int classid;

@property(nonatomic,weak)id<GRSocialDelegate>delegate;

+ (GRSocial *)getInstance;

// 权限注册
-(void)registerWeiboWithAppId:(NSString *)appId;
-(void)registerWeiXinWithAppId:(NSString *)appId description:(NSString *)description;
-(void)registerQQWithAppId:(NSString *)appId;

- (BOOL)canWeixinShare;
- (BOOL)canWeixinLogin;
- (BOOL)canWeiboShare;
- (BOOL)canWeiboLogin;
- (BOOL)canQQShare;
- (BOOL)canQQLogin;
// 检查是否安装
-(BOOL)checkQQ;
-(BOOL)checkWeiBo;
-(BOOL)checkWeiXin;


-(NSArray *)getShareArray;

/**
 *  获取可以分享的列表
 *
 *  @return GRShareModel
 */
-(NSArray *)getCanShareArray;

/**
 *  获取可以分享而且分享成功后直接返回应用的列表，用于需要分享成功后要做相应处理的需求。
 *
 *  @return GRShareModel
 */
-(NSArray *)getCanShareAndNoConfirmArray;

-(NSArray *)getLoginArray;
/**
 *  获取可以登陆的列表
 *
 *  @return GRLoginModel
 */
-(NSArray *)getCanLoginArray;

#pragma mark - login

// 第三方登陆
-(void)loginQQWithdelegate:(id<GRSocialDelegate>)delegate;
-(void)loginWeiBoWithdelegate:(id<GRSocialDelegate>)delegate;
-(void)loginWeiXinWithdelegate:(id<GRSocialDelegate>)delegate;

#pragma mark - share

// 分享;
- (BOOL)shareWithShareType:(GRShareType)shareType Content:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate;

/**
 *  分享到QQ，分享成功后会提示是否留在应用
 *
 *  @param content  最大512
 *  @param title    最大128,最小1
 *  @param url      最长512个字符
 *  @param image    最大1M字节
 *  @param delegate 分享回调
 *
 *  @return 分享是否成功
 */
- (BOOL)shareQQWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate;

/**
 *  分享到微博，分享成功后直接跳回应用
 *  标题加内容最大140
 *
 *  @param content  内容
 *  @param title    标题
 *  @param url      url
 *  @param image    最大10M
 *  @param delegate 回调
 *
 *  @return 分享是否成功
 */
- (BOOL)shareWeiBoWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate;

/**
 *  分享到微信好友，分享成功后会提示是否留在应用
 *
 *  @param content  最大1024
 *  @param title    最大512
 *  @param url      分享的链接
 *  @param image    最大32K，长宽 < 600
 *  @param delegate 分享的回调
 *
 *  @return 是否分享成功
 */
- (BOOL)shareWeiXinWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate;

/**
 *  分享到朋友圈，分享成功后直接跳回应用
 *
 *  @param content  无用
 *  @param title    最大512
 *  @param url      分享的链接
 *  @param image    最大32K，长宽 < 600
 *  @param delegate 回调
 *
 *  @return 分享是否成功
 */
- (BOOL)sharePengYouQuanWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate;

@end
