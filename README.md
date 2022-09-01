# flutter_blcs
- flutter初学者简单用例
- 一款集合各种常用widget、功能、开源库简单运用的示例Demo,方便知识学习与回顾。
- 主要功能：目前分为五个模块：登录、组件、开源库、应用配置、功能 等模块
1.  登录模块：包含欢迎、引导、登录、注册、修改密码等页面
2.  组件模块：常用widget介绍与运用
3.  开源库模块：常用开源库介绍与运用如：Camera,Dio
4.  应用配置模块：常见应用配置运用如：语言国际化、主题颜色
5.  功能模块：常见功能介绍及使用如：动画及自定义widget

## [下载地址](https://www.pgyer.com/corn)
![二维码](https://github.com/DayorNight/flutter_blcs/blob/master/static/images/corn_download.png)

## 工程目录
flutter_blcs
```
├── android
├── ios
├── lib             // 代码部分
    ├── base        // 存放基类
    ├── bean        // 实体类
    ├── common      // 一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
    ├── config        // 存放应用配置信息
    ├── generated   // 多语言插件生成的代码
    ├── http        // 网络请求
    ├── l10n        // 多语言文字设置
    ├── models      // 数据处理类
    ├── pages       // 存放页面  
    ├── routes      // 路由地址
    ├── viewmodel   // 交互逻辑
    └── widgets     // 自定义widget
├── static          // 本地文件
└── test
```
# pages
|序号|页面|类名|
|--|--|--|
|1  |欢迎        |SplashPage
|2  |引导        |GuidePage
|3  |登录        |LoginPage
|4  |注册        |RegisterPage
|5  |忘记密码     |ForgetPsdPage
|6  |menu功能    |FunctionPage
|7  |menu我的    |MePage
|8  |menuUI      |WidgetPage
|9  |全局状态管理 |ProviderPage
|10 |屏幕适配     |ScreenAdapterPage
|11 |基础知识     |BasicKnowledgePage
|12 |切换主题     |SettingThemePage
|13 |切换语言     |SwitchLanguagePage
|14 |首页         |MainPage
|15 |UI切换动画    |AnimatedSwitcherPage
|16 |简单动画      |AnimationPage
|17 |应用生命周期   |AppLifecyclePage
|18 |自定义Widget  |CustomWidgetPage
|19 |Hero动画      |HeroPage
|20 |JSON解析      |JsonParsePage
|21 |Widget生命周期 |LifeCyclePage
|22 |交织动画       |MixedAnimationPage
|23 |个人信息       |PersonalInformationPage
|24 |头像           |PersonalPage
|25 |路由动画       |RouteAnimationPage
|26 |flutter错误展示 |ErrorPage
|27 |网络请求       |NetWorkPage
|28 |相机          |CameraPage
|29 |Isolate       |IsolatePage
|30 |ImagePicker   |ImagePickerPage
## widget

## function
|序号|页面|类名|
|--|--|--|
|1  |屏幕适配      |ScreenAdapterPage
|2  |全局状态管理   |ProviderPage
|3  |网络请求      |NetWorkPage
|4  |相机         |CameraPage
|5  |ImagePicker  |ImagePickerPage
## my
|序号|页面|类名|
|--|--|--|
|1  |应用生命周期      |AppLifecyclePage
|2  |Widget生命周期   |LifeCyclePage
|3  |Hero动画    |HeroPage
|4  |简单动画    |AnimationPage
|5  |路由动画    |RouteAnimationPage
|6  |交织动画    |MixedAnimationPage
|7  |UI切换动画  |AnimatedSwitcherPage
|8  |自定义View  |CustomPage
|9  |JSON解析    |JsonParsePage
|10 |Isolate    |IsolatePage

# 功能运用
1. 异常捕获
2. 双击返回 
3. sp封装
4. 轮播图

## 引入库
|序号|库名|描述|
|--|--|--|
|1  |flutter_ume    |Flutter 应用内调试工具平台
|2  |dio        |网络请求
|3  |encrypt    |RSA加密
|4  |provider   |全局状态管理
|5  |shared_preferences     |持久化操作
|6  |card_swiper            |轮播图
|7  |flutter_screenutil     |屏幕适配
|8  |flutter_syntax_view    |代码高亮
|9  |logger         |log打印
|10 |flare_flutter  |动画插件
|11 |google_fonts   |google字体 
|12 |simple_animations  |自定义动画
|13 |json_annotation    |支持自动化json
|14 |introduction_screen    |引导页、介绍页
|15 |dio_cookie_manager     |cookie管理
|16 |flutter_svg            |引入SVG图
|17 |image_picker           |图片视频选择器


## 补充
1. json转换
- 工具: mac搜索‘Paste JSON as Code’下载
- 在线转换：https://app.quicktype.io/  或  https://javiercbk.github.io/json_to_dart/
- Android studio 插件 JsonToDart

## 任务
1. get 
2. mixin
3. extension 
