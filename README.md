# GreedSocialSDK

社交化SDK集成，包括QQ、微信、微博

## Installation

pod 'GreedSocialSDK'

## Usage

所有方法详见[GRSocial.h](GreedSocialSDK/GRSocial.h).可以用 `[GRSocial getInstance]`单例的方法。

使用流程:register > 检测是否可用 > register> share或login.

* [GreedTencentOpenAPI](https://github.com/greedlab/GreedTencentOpenAPI)
* [GreedWeChatSDK](https://github.com/greedlab/GreedWeChatSDK)
* [weibo_ios_sdk](https://github.com/sinaweibosdk/weibo_ios_sdk)

## Develop

有依赖的第三方库，所以`lint `和`push `时要加`--use-libraries`

```shell
$ pod spec lint GreedSocialSDK.podspec --use-libraries --verbose --allow-warnings
$ pod trunk push GreedSocialSDK.podspec  --use-libraries --verbose --allow-warnings
```

## Change Log

[CHANGELOG](CHANGELOG.md)


## LICENSE

[MIT](LICENSE)
