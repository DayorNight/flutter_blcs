
import 'package:flutter/material.dart';
///注册页面
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '请输入手机号',
                    icon : Text('手机账号'),
                    suffixIcon: ElevatedButton(child: Text('发送验证码'),onPressed: (){},),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return '请输入手机号';
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '请输入验证码',
                    icon : Text('验 证 码'),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return '请输入验证码';
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 11,
                  decoration: InputDecoration(
                    counterText: '',
                    icon : Text('登录密码'),
                    hintText: '请输入登录密码',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return '请输入登录密码';
                    }
                    if(value.length<6){
                      return '密码不能小于6位数';
                    }
                  },
                ),
                Row(
                  children: [
                    Text("  性  别  "),
                    SizedBox(width: 12,),
                    Switch(value: true, onChanged: (change){
                    }),
                    Text("男"),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '请输入出生日期',
                    icon : Text('出生日期'),
                  ),
                  textInputAction: TextInputAction.send,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text('注册')),
                )
              ],
            ),
        ),
      ),
    );
  }
}
