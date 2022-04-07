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

# 功能运用
1. 异常捕获
2. 双击返回 
3. sp封装
4. 轮播图

# pages
1. 切换主题 SettingThemeView
2. 切换语言 SwitchLanguageView

## widget

## libs
1. 屏幕适配     ScreenAdapterView
2. 全局状态管理   ProviderView

## my
1. 应用生命周期    AppLifecycleView
2. Widget生命周期 LifeCycleView
3. Hero动画   HeroView
4. 简单动画    AnimationView
5. 路由动画    RouteAnimationView
6. 交织动画     MixedAnimationPage
7. UI切换动画   AnimatedSwitcherPage

##任务
1. 自定义View
2. 引导页
3. json解析

## 补充
1. json转换
- 工具: mac搜索‘Paste JSON as Code’下载
- 在线转换：https://app.quicktype.io/  或  https://javiercbk.github.io/json_to_dart/
- Android studio 插件 JsonToDart

