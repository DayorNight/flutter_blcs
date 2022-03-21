import 'package:flutter/material.dart';
///忘记密码页面
class ForgetPsdView extends StatefulWidget {
  const ForgetPsdView({Key? key}) : super(key: key);

  @override
  _ForgetPsdViewState createState() => _ForgetPsdViewState();
}

class _ForgetPsdViewState extends State<ForgetPsdView> {
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
