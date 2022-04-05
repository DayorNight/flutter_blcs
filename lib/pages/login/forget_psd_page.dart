import 'package:flutter/material.dart';
///忘记密码页面
class ForgetPsdPage extends StatefulWidget {
  static final String keys = "forgetPsdView";

  const ForgetPsdPage({Key? key}) : super(key: key);

  @override
  _ForgetPsdPageState createState() => _ForgetPsdPageState();
}

class _ForgetPsdPageState extends State<ForgetPsdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('忘记密码'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Text('忘记密码'),
      ),
    );
  }
}
