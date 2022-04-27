# flutter_blcs

## 工程目录

flutter_blcs
├── android
├── ios
├── lib             //代码部分
    ├── bean        // 实体
    ├── common      //一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
    ├── generated   //多语言插件生成的代码
    ├── l10n        //多语言文字设置
    ├── models      //数据处理类
    ├── pages       //存放页面  
    ├── routes      //路由地址
    ├── viewmodel   //交互逻辑
    └── widgets     //APP内封装的一些Widget组件都在该目录下
├── static          //本地文件
└── test

# pages
1. 切换主题 SettingThemePage
2. 切换语言 SwitchLanguagePage

## widget

## function
1. ScreenAdapterPage：屏幕适配
2. ProviderPage：全局状态管理

## my
1. 应用生命周期    AppLifecyclePage
2. Widget生命周期 LifeCyclePage
3. Hero动画   HeroPage
4. 简单动画    AnimationPage
5. 路由动画    RouteAnimationPage
6. 交织动画     MixedAnimationPage
7. UI切换动画   AnimatedSwitcherPage
8. 自定义View   CustomPage

# 功能运用
1. 异常捕获
2. 双击返回 
3. sp封装
4. 轮播图

## 引入库
1. flutter_ume: Flutter 应用内调试工具平台
2. dio:网络请求
3. encrypt:RSA加密
4. provider:全局状态管理
5. shared_preferences:持久化操作
6. card_swiper:轮播图
7. flutter_screenutil:屏幕适配
8. flutter_syntax_view:代码高亮
9. logger:log打印
10. flare_flutter:动画插件
11. google_fonts:google字体
12. simple_animations:自定义动画
13. json_annotation:支持自动化json

##任务
2. 引导页
3. json解析
4. 网络加载
5. 拍照
6. 视频播放


## 补充
1. json转换
- 工具: mac搜索‘Paste JSON as Code’下载
- 在线转换：https://app.quicktype.io/  或  https://javiercbk.github.io/json_to_dart/
- Android studio 插件 JsonToDart

