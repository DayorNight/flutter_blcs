import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/draw_list.dart';
///首页
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _theme, icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg",fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      ),
      drawer: Drawer(
    child: ListView(
           padding: EdgeInsets.zero,
           children: <Widget>[
             UserAccountsDrawerHeader( //用户信息栏
               accountName: Text("blcs"),
               accountEmail: Text("xxxxxx@xxx.com"),
               currentAccountPicture: CircleAvatar(
                   backgroundImage: AssetImage("images/ic_avator.png"),
               ),
               otherAccountsPictures: <Widget>[  //其他账号头像
                 IconButton(onPressed: (){
                   Navigator.of(context).pop();
                 }, icon: Icon(Icons.exit_to_app_rounded))
               ],
               onDetailsPressed: (){}, //下拉箭头
               decoration: BoxDecoration(  //背景图片
                 image: DecorationImage(
                     image: NetworkImage('https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2491682377,1019940373&fm=26&gp=0.jpg'),
                     fit: BoxFit.cover	//图片不变性裁剪居中显示
                 ),
               ),
             ),
             ListView.builder(itemBuilder: _itemBuilder,itemCount:_datas.length,shrinkWrap: true,),
             ListTile(
               leading: Icon(Icons.settings),
               title: Text('Setting'),
               trailing: Icon(Icons.arrow_forward_ios_rounded) ,
               onTap: (){
                 print("Setting");
               },
             ),
           ],
         ),
      ),
    );
  }
  /// 前往主题设置
  void _theme(){
    Navigator.of(context).pushNamed('themeView');
  }
  /// draw list
  Widget _itemBuilder(BuildContext context,int index){
    return ListTile(
      leading: Icon(_datas[index].icon),
      title: Text(_datas[index].title),
      trailing: Icon(_datas[index].trailing),
      onTap: (){
        print("index $index");
      },
    );
  }

  late List<DrawListBean> _datas;
  void initData() async{
    var datas =<DrawListBean>[];
    var drawListBean = DrawListBean(Icons.message, 'Messages', Icons.arrow_forward_sharp);
    datas.add(drawListBean);
    datas.add(drawListBean);
    datas.add(drawListBean);
    datas.add(drawListBean);
    setState(() {
      _datas = datas;
    });
  }
}
