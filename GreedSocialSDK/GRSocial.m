//
//  GRSocial.m
//  Pods
//
//  Created by Bell on 16/2/22.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "GRSocial.h"
#import "UIImage+Greed.h"

@implementation GRSocial

+ (GRSocial *)getInstance {
    static dispatch_once_t onceToken;
    static GRSocial *__sharedInstance;

    dispatch_once(&onceToken, ^{
        __sharedInstance = [[GRSocial alloc] init];
    });
    return __sharedInstance;
}

#pragma mark - public

- (void)registerWeiboWithAppId:(NSString *)appId {
    [WeiboSDK registerApp:appId];
}

- (void)registerWeiXinWithAppId:(NSString *)appId description:(NSString *)description {
    [WXApi registerApp:appId];
}

- (void)registerWeiXinWithAppId:(NSString *)appId {
    [WXApi registerApp:appId];
}

- (void)registerQQWithAppId:(NSString *)appId {
    self.tencentOAuth = [[TencentOAuth alloc] initWithAppId:appId andDelegate:self];
}

- (BOOL)canWeixinShare {
    return [WXApi isWXAppInstalled];
}

- (BOOL)canWeixinLogin {
//    return YES;
    return [WXApi isWXAppInstalled];
}

- (BOOL)canWeiboShare {
    return [WeiboSDK isWeiboAppInstalled];
}

- (BOOL)canWeiboLogin {
    return YES;
}

- (BOOL)canQQShare {
    return YES;
}

- (BOOL)canQQLogin {
    return YES;
}

- (BOOL)isWeiXinInstalled {
    return [WXApi isWXAppInstalled];
}

- (BOOL)isQQInstalled {
    return [QQApiInterface isQQInstalled];
}

- (BOOL)isWeiBoInstalled {
    return [WeiboSDK isWeiboAppInstalled];
}

- (NSArray *)shareArray {
    NSMutableArray *mutableArray = [NSMutableArray array];
    {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"微信";
        entity.image = [UIImage imageNamed:@"gr_share_weixin"];
        entity.shareType = GRShareTypeWeiXin;
        [mutableArray addObject:entity];
    }
    {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"朋友圈";
        entity.image = [UIImage imageNamed:@"gr_share_pengyouquan"];
        entity.shareType = GRShareTypePengYouQuan;
        [mutableArray addObject:entity];
    }
    {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"新浪微博";
        entity.image = [UIImage imageNamed:@"gr_share_weibo"];
        entity.shareType = GRShareTypeWeiBo;
        [mutableArray addObject:entity];
    }
    {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"QQ";
        entity.image = [UIImage imageNamed:@"gr_share_qq"];
        entity.shareType = GRShareTypeQQ;
        [mutableArray addObject:entity];
    }
    return mutableArray;
}

- (NSArray *)canShareArray {
    NSMutableArray *mutableArray = [NSMutableArray array];
    if ([self canWeixinShare]) {
        {
            GRShareModel *entity = [[GRShareModel alloc] init];
            entity.title = @"微信";
            entity.image = [UIImage imageNamed:@"gr_share_weixin"];
            entity.shareType = GRShareTypeWeiXin;
            [mutableArray addObject:entity];
        }
        {
            GRShareModel *entity = [[GRShareModel alloc] init];
            entity.title = @"朋友圈";
            entity.image = [UIImage imageNamed:@"gr_share_pengyouquan"];
            entity.shareType = GRShareTypePengYouQuan;
            [mutableArray addObject:entity];
        }
    }
    if ([self canWeiboShare]) {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"新浪微博";
        entity.image = [UIImage imageNamed:@"gr_share_weibo"];
        entity.shareType = GRShareTypeWeiBo;
        [mutableArray addObject:entity];
    }
    if ([self canQQShare]) {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"QQ";
        entity.image = [UIImage imageNamed:@"gr_share_qq"];
        entity.shareType = GRShareTypeQQ;
        [mutableArray addObject:entity];
    }
    return mutableArray;
}

- (NSArray *)canShareAndNoConfirmArray {
    NSMutableArray *mutableArray = [NSMutableArray array];
    if ([self canWeixinShare]) {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"朋友圈";
        entity.image = [UIImage imageNamed:@"gr_share_pengyouquan"];
        entity.shareType = GRShareTypePengYouQuan;
        [mutableArray addObject:entity];
    }
    if ([self canWeiboShare]) {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"新浪微博";
        entity.image = [UIImage imageNamed:@"gr_share_weibo"];
        entity.shareType = GRShareTypeWeiBo;
        [mutableArray addObject:entity];
    }
    if ([self canQQShare]) {
        GRShareModel *entity = [[GRShareModel alloc] init];
        entity.title = @"QQ空间";
        entity.image = [UIImage imageNamed:@"gr_share_qq"];
        entity.shareType = GRShareTypeQZone;
        [mutableArray addObject:entity];
    }
    return mutableArray;
}

- (NSArray *)loginArray;
{
    NSMutableArray *mutableArray = [NSMutableArray array];
    {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"微信";
        entity.image = [UIImage imageNamed:@"gr_share_weixin"];
        entity.loginType = GRLoginTypeWeiXin;
        [mutableArray addObject:entity];
    }
    {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"新浪微博";
        entity.image = [UIImage imageNamed:@"gr_share_weibo"];
        entity.loginType = GRLoginTypeWeiBo;
        [mutableArray addObject:entity];
    }
    {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"QQ";
        entity.image = [UIImage imageNamed:@"gr_share_qq"];
        entity.loginType = GRLoginTypeQQ;
        [mutableArray addObject:entity];
    }
    return mutableArray;
}

- (NSArray *)canLoginArray {
    NSMutableArray *mutableArray = [NSMutableArray array];
    if ([self canWeixinLogin]) {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"微信";
        entity.image = [UIImage imageNamed:@"gr_share_weixin"];
        entity.loginType = GRLoginTypeWeiXin;
        [mutableArray addObject:entity];
    }
    if ([self canWeiboLogin]) {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"新浪微博";
        entity.image = [UIImage imageNamed:@"gr_share_weibo"];
        entity.loginType = GRLoginTypeWeiBo;
        [mutableArray addObject:entity];
    }
    if ([self canQQLogin]) {
        GRLoginModel *entity = [[GRLoginModel alloc] init];
        entity.title = @"QQ";
        entity.image = [UIImage imageNamed:@"gr_share_qq"];
        entity.loginType = GRLoginTypeQQ;
        [mutableArray addObject:entity];
    }
    return mutableArray;
}

#pragma mark - login

- (void)loginQQWithdelegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeLogin;
    self.loginType = GRLoginTypeQQ;
//    NSArray* permissions = [NSArray arrayWithObjects:
//                            kOPEN_PERMISSION_GET_USER_INFO,
//                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
//                            kOPEN_PERMISSION_ADD_ALBUM,
//                            kOPEN_PERMISSION_ADD_ONE_BLOG,
//                            kOPEN_PERMISSION_ADD_SHARE,
//                            kOPEN_PERMISSION_ADD_TOPIC,
//                            kOPEN_PERMISSION_CHECK_PAGE_FANS,
//                            kOPEN_PERMISSION_GET_INFO,
//                            kOPEN_PERMISSION_GET_OTHER_INFO,
//                            kOPEN_PERMISSION_LIST_ALBUM,
//                            kOPEN_PERMISSION_UPLOAD_PIC,
//                            kOPEN_PERMISSION_GET_VIP_INFO,
//                            kOPEN_PERMISSION_GET_VIP_RICH_INFO,
//                            nil];
    NSArray *permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_ADD_ALBUM,
                            kOPEN_PERMISSION_ADD_IDOL,
                            kOPEN_PERMISSION_ADD_ONE_BLOG,
                            kOPEN_PERMISSION_ADD_PIC_T,
                            kOPEN_PERMISSION_ADD_SHARE,
                            kOPEN_PERMISSION_ADD_TOPIC,
                            kOPEN_PERMISSION_CHECK_PAGE_FANS,
                            kOPEN_PERMISSION_DEL_IDOL,
                            kOPEN_PERMISSION_DEL_T,
                            kOPEN_PERMISSION_GET_FANSLIST,
                            kOPEN_PERMISSION_GET_IDOLLIST,
                            kOPEN_PERMISSION_GET_INFO,
                            kOPEN_PERMISSION_GET_OTHER_INFO,
                            kOPEN_PERMISSION_GET_REPOST_LIST,
                            kOPEN_PERMISSION_LIST_ALBUM,
                            kOPEN_PERMISSION_UPLOAD_PIC,
                            kOPEN_PERMISSION_GET_VIP_INFO,
                            kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                            kOPEN_PERMISSION_GET_INTIMATE_FRIENDS_WEIBO,
                            kOPEN_PERMISSION_MATCH_NICK_TIPS_WEIBO,
                            nil];
    [_tencentOAuth authorize:permissions];
}

- (void)loginWeiXinWithdelegate:(id<GRSocialDelegate>)delegate {
    [self loginWeiXinWithViewController:nil delegate:delegate];
}

- (void)loginWeiXinWithViewController:(UIViewController*)viewController delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeLogin;
    self.loginType = GRLoginTypeWeiXin;
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"login";
    [WXApi sendAuthReq:req viewController:viewController delegate:self];
}

- (void)loginWeiBoWithRedirectURI:(NSString *)redirectURI
                         delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeLogin;
    self.loginType = GRLoginTypeWeiBo;
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = redirectURI;
    request.scope = @"all";
    request.userInfo = @{ @"SSO_From" : @"SendMessageToWeiboViewController",
                          @"Other_Info_1" : [NSNumber numberWithInt:123],
                          @"Other_Info_2" : @[ @"obj1", @"obj2" ],
                          @"Other_Info_3" : @{@"key1" : @"obj1", @"key2" : @"obj2"} };
    [WeiboSDK sendRequest:request];
}

#pragma mark - share

- (BOOL)shareWithShareType:(GRShareType)shareType Content:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate {
    if (shareType == GRShareTypeQQ) {
        return [self shareQQWithContent:content title:title url:url image:image delegate:delegate];
    } else if (shareType == GRShareTypeWeiBo) {
        return [self shareWeiBoWithContent:content title:title url:url image:image delegate:delegate];
    } else if (shareType == GRShareTypeWeiXin) {
        return [self shareWeiXinWithContent:content title:title url:url image:image delegate:delegate];
    } else if (shareType == GRShareTypePengYouQuan) {
        return [self sharePengYouQuanWithContent:content title:title url:url image:image delegate:delegate];
    }
    return NO;
}

- (BOOL)shareQQWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeShare;
    self.shareType = GRShareTypeQQ;

    NSData *data = [image gr_dataWithMaxLength:1 * 1024 * 1024];

    // 0 < 标题长度必须 < 128
    title = title.length == 0 ? @" " : (title.length > 128 ? [title substringToIndex:127] : title);
    // 内容长度必须 < 512
    content = content.length > 512 ? [content substringToIndex:511] : content;
    QQApiNewsObject *new = [ QQApiNewsObject objectWithURL : [NSURL URLWithString:url] title : title description : content previewImageData : data ];

    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:new];
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    return sent == EQQAPISENDSUCESS;
}

- (BOOL)shareWeiBoWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeShare;
    self.shareType = GRShareTypeWeiBo;

    NSInteger maxLength = 140;
    content = (content.length + url.length + 1) > maxLength ? [content substringToIndex:(maxLength - url.length - 2)] : content;

    WBMessageObject *message = [WBMessageObject message];
    NSString *messagetitle = [NSString stringWithFormat:@"%@ %@", content, url];
    message.text = messagetitle;
    WBImageObject *imageObject = [WBImageObject object];

    NSData *data = [image gr_dataWithMaxLength:10 * 1024 * 1024];
    imageObject.imageData = data;
    if (imageObject.imageData) {
        message.imageObject = imageObject;
    }
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    request.userInfo = @{ @"ShareMessageFrom" : @"SendMessageToWeiboViewController",
                          @"Other_Info_1" : [NSNumber numberWithInt:123],
                          @"Other_Info_2" : @[ @"obj1", @"obj2" ],
                          @"Other_Info_3" : @{@"key1" : @"obj1", @"key2" : @"obj2"} };

    return [WeiboSDK sendRequest:request];
}

- (BOOL)shareWeiXinWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeShare;
    self.shareType = GRShareTypeWeiXin;
    title = title.length > 512 ? [title substringToIndex:512] : title;
    content = content.length > 1024 ? [content substringToIndex:1023] : content;
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = content;
    image = [image gr_reSizeToMaxSize:CGSizeMake(600.f, 600.f)];
    NSData *data = [image gr_dataWithMaxLength:32 * 1024];
    [message setThumbData:data];
//    [message setThumbImage:[image gr_imageWithMaxLength:32 * 1024]];
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = url;
    message.mediaObject = ext;

    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = WXSceneSession;
    req.bText = NO;
    req.message = message;
    return [WXApi sendReq:req];
}

- (BOOL)sharePengYouQuanWithContent:(NSString *)content title:(NSString *)title url:(NSString *)url image:(UIImage *)image delegate:(id<GRSocialDelegate>)delegate {
    self.delegate = delegate;
    self.socialType = GRSocialTypeShare;
    self.shareType = GRShareTypePengYouQuan;
    WXMediaMessage *message = [WXMediaMessage message];

    // 朋友圈分享只会显示title

    NSString *newTitle = [NSString stringWithFormat:@"%@\n%@", title, content];
    newTitle = newTitle.length > 512 ? [newTitle substringToIndex:512] : newTitle;
    message.title = newTitle;
    image = [image gr_reSizeToMaxSize:CGSizeMake(600.f, 600.f)];
    NSData *data = [image gr_dataWithMaxLength:32 * 1024];
    [message setThumbData:data];
//    [message setThumbImage:[image gr_imageWithMaxLength:32 * 1024]];
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = url;

    message.mediaObject = ext;

    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    BOOL result = [WXApi sendReq:req];
    return result;
}

#pragma mark - handle

- (BOOL)handleApplication:(UIApplication *)application openURL:(NSURL *)url {
    BOOL result = NO;
    if (self.socialType == GRSocialTypeLogin) {
        if (self.loginType == GRLoginTypeQQ) {
            if ([TencentOAuth CanHandleOpenURL:url]) {
                result = [TencentOAuth HandleOpenURL:url];
            }
        } else if (self.loginType == GRLoginTypeWeiBo) {
            result = [WeiboSDK handleOpenURL:url delegate:self];
        } else if (self.loginType == GRLoginTypeWeiXin) {
            result = [WXApi handleOpenURL:url delegate:self];
        }
    } else if (self.socialType == GRSocialTypeLogin) {
        if (self.shareType == GRShareTypeQQ) {
            result = [QQApiInterface handleOpenURL:url delegate:self];
        } else if (self.shareType == GRShareTypeWeiBo) {
            result = [WeiboSDK handleOpenURL:url delegate:self];
        } else if (self.shareType == GRShareTypeWeiXin) {
            result = [WXApi handleOpenURL:url delegate:self];
        } else if (self.shareType == GRShareTypePengYouQuan) {
            result = [WXApi handleOpenURL:url delegate:self];
        }
    }
    self.socialType = GRSocialTypeNone;
    return result;
}

#pragma mark - WXApiDelegate
#pragma mark - TencentSessionDelegate - QQApiInterfaceDelegate

- (void)onReq:(BaseReq *)req {
    NSLog(@"onReq");
}

/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp  具体的回应内容，是自动释放的
 */
- (void)onResp:(id)resp {
    if (_socialType == GRSocialTypeLogin) {                              // 登陆
        if (_loginType == GRLoginTypeWeiXin) { // 微信登陆
            if ([resp isKindOfClass:[SendAuthResp class]]) {
                SendAuthResp *sendAuthResp = (SendAuthResp *) resp;
                if (sendAuthResp.errCode == 0) {
                    NSLog(@"weixin login success");
                    if ([self.delegate respondsToSelector:@selector(didWeiXinLoginSuccess:sender:)]) {
                        [self.delegate didWeiXinLoginSuccess:sendAuthResp sender:self];
                    }
                }
            }
        }
    } else {                               // 分享
        if (_shareType == GRShareTypeQQ) { // QQ分享
            if ([resp isKindOfClass:[QQBaseResp class]]) {
                QQBaseResp *qqResp = resp;
                if ([qqResp.result intValue] == 0) {
                    // qq分享成功
                    NSLog(@"QQ share success");
                    if ([self.delegate respondsToSelector:@selector(didQQShareSuccess:sender:)]) {
                        [self.delegate didQQShareSuccess:qqResp sender:self];
                    }
                }
            }
        } else if (_shareType == GRShareTypeWeiXin) { // 微信好友分享
            if ([resp isKindOfClass:[BaseResp class]]) {
                BaseResp *wxResp = resp;
                if (wxResp.errCode == 0) {
                    // 微信分享成功;
                    NSLog(@"weixin share success");
                    if ([self.delegate respondsToSelector:@selector(didWeiXinShareSuccess:sender:)]) {
                        [self.delegate didWeiXinShareSuccess:wxResp sender:self];
                    }
                }
            }
        } else if (_shareType == GRShareTypePengYouQuan) { // 朋友圈分享
            if ([resp isKindOfClass:[BaseResp class]]) {
                BaseResp *wxResp = resp;
                if (wxResp.errCode == 0) {
                    // 朋友圈分享成功;
                    NSLog(@"pengyouquan share success");
                    if ([self.delegate respondsToSelector:@selector(didPengYouQuanShareSuccess:sender:)]) {
                        [self.delegate didPengYouQuanShareSuccess:wxResp sender:self];
                    }
                }
            }
        }
    }
}

#pragma mark -WeiboSDKDelegate

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
}

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    if ([response isKindOfClass:[WBSendMessageToWeiboResponse class]]) { // 微博分享
        WBSendMessageToWeiboResponse *sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse *) response;
        if (sendMessageToWeiboResponse.statusCode == 0) {
            NSLog(@"weibo share success");
            if ([self.delegate respondsToSelector:@selector(didWeiBoShareSuccess:sender:)]) {
                [self.delegate didWeiBoShareSuccess:sendMessageToWeiboResponse sender:self];
            }
        }
    } else if ([response isKindOfClass:[WBAuthorizeResponse class]]) { // 微博登陆
        NSLog(@"weibo login success");
        WBAuthorizeResponse *authorizeResponse = (WBAuthorizeResponse *) response;
        if ([self.delegate respondsToSelector:@selector(didWeiBoLoginSuccess:sender:)]) {
            [self.delegate didWeiBoLoginSuccess:authorizeResponse sender:self];
        }
    }
}

#pragma mark - TencentSessionDelegate - TencentLoginDelegate(授权登录回调协议)

- (void)tencentDidLogin {
    if ([_tencentOAuth accessToken]) { // QQ登陆
        NSLog(@"QQ login success");
        if ([self.delegate respondsToSelector:@selector(didQQLoginSuccess:sender:)]) {
            [self.delegate didQQLoginSuccess:_tencentOAuth sender:self];
        }
    }
}

/**
 * 登录失败后的回调
 * @param cancelled 代表用户是否主动退出登录
 */
- (void)tencentDidNotLogin:(BOOL)cancelled {
}

/**
 * 登录时网络有问题的回调
 */
- (void)tencentDidNotNetWork {
}

#pragma mark - TencentSessionDelegate - QQApiInterfaceDelegate

/**
 处理QQ在线状态的回调
 */
- (void)isOnlineResponse:(NSDictionary *)response {
}

#pragma mark - TencentSessionDelegate - TencentWebViewDelegate
#pragma mark - TencentSessionDelegate - TencentApiInterfaceDelegate

@end
