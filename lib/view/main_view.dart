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
      drawer: Drawer(
        child: ListView(
               padding: EdgeInsets.zero,
               children: <Widget>[
                 UserAccountsDrawerHeader(
                     currentAccountPicture: Icon(Icons.circle),
                     currentAccountPictureSize: Size.square(100),
                     accountName: Text("blcs"),
                     accountEmail: Text('xxxxxxx@qq.com')),
                 // ListView.builder(itemBuilder: _drawList,itemCount: _datas.length, shrinkWrap: true,),
                 // ListTile(
                 //   leading: Icon(Icons.account_circle),
                 //   title: Text('Profile'),
                 //   trailing: Icon(Icons.arrow_forward_sharp),
                 // ),
                 // ListTile(
                 //   leading: Icon(Icons.settings),
                 //   title: Text('Settings'),
                 //   trailing: Icon(Icons.exit_to_app,color: Colors.blue,),
                 // ),
               ],
             ),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.fill,);
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ),
      )
    );
  }
  ///前往主题设置
  void _theme(){
    Navigator.of(context).pushNamed('themeView');
  }

  Widget _drawList(BuildContext context,int index){
    return ListTile(
      leading: Icon(_datas[index].icon),
      title: Text(_datas[index].title),
      trailing: Icon(_datas[index].trailing),
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

