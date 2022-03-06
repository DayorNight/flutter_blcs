import 'package:flutter/material.dart';
///首页
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: _theme, icon: Icon(Icons.settings))
        ],
      ),
    );
  }

  void _theme(){
    Navigator.of(context).pushNamed('themeView');
  }
}
