# flutter_blcs

## 工程目录

flutter_blcs
├── android
├── fonts       //保存Icon文件
├── l10n-arb    //多语言支持
├── imgs        //保存图片
├── ios         
├── jsons       //Json文件
├── lib         //代码部分
    ├── common  //一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
    ├── l10n    //国际化相关的类都在此目录下
    ├── models  //Json文件对应的Dart Model类会在此目录下
    ├── states  //保存APP中需要跨组件共享的状态类
    ├── routes  //存放所有路由页面类
    └── widgets //APP内封装的一些Widget组件都在该目录下
└── test        

## 文件
1. Global:管理APP的全局变量
2. Git:封装网络请求
3. CacheObject:网络接口缓存
4. ChangeNotifierProvider:信息变更通知






//user   Github账号信息，结构见"user.json"
//token   登录用户的token(oauth)或密码
//theme  主题索引
//cache   缓存策略信息，结构见"cacheConfig.json"
//lastLogin  最近一次的注销登录的用户名
//locale  APP语言信息


//enable 是否启用缓存
//maxAge 缓存的最长时间，单位（秒）
//maxCount 最大缓存数


//name   项目名称
//full_name  项目完整名称
//owner  项目拥有者，结构见"user.json"
//parent  如果是fork的项目，则此字段表示fork的父项目信息
//private  是否私有项目
//description 项目描述
//fork  该项目是否为fork的项目
//language  该项目的主要编程语言
//forks_count fork了该项目的数量
//stargazers_count  该项目的star数量
//size 项目占用的存储大小
//default_branch  项目的默认分支
//open_issues_count 该项目当前打开的issue数量
//subscribers_count 订阅（关注）该项目的人数
//license 该项目的开源许可证



//login  用户登录名
//avatar_url  用户头像地址
//type  用户类型，可能是组织
//name  用户名字
//company   公司
//blog  博客地址
//location 用户所处地理位置
//email 邮箱
//bio 用户简介
//public_repos 公开项目数
//followers 关注该用户的人数
//following 该用户关注的人数
//created_at 账号创建时间
//updated_at 账号信息更新时间
//total_private_repos 该用户总的私有项目数(包括参与的其它组织的私有项目)
//owned_private_repos 该用户自己的私有项目数