# flutter_blcs

## 工程目录

flutter_blcs
├── android
├── imgs        //保存图片
├── ios         
├── lib         //代码部分
    ├── common  //一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
    ├── l10n    //国际化相关的类都在此目录下
    ├── models  //Json文件对应的Dart Model类会在此目录下
    ├── states  //保存APP中需要跨组件共享的状态类
    ├── routes  //存放所有路由页面类
    └── widgets //APP内封装的一些Widget组件都在该目录下
└── test        

## 功能
1. 切换主题 SettingThemeView
2. 切换语言 SwitchLanguageView
3. 异常捕获 handleError

## 其他
1. 应用生命周期 AppLifecycleView
2. Widget生命周期 LifeCycleView
