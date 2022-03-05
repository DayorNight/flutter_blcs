import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/rsa_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("登陆"),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "images/ic_coffee.png",
                width: 200,
                height: 200,
                fit: BoxFit.fill,
              )
            ),
            SizedBox(height: 16),
            Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      counterText:'',//隐藏最大长度字数
                      hintText: '请输入手机号',
                      labelText: '账号',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return '未输入手机号';
                      }
                    },
                    textInputAction: TextInputAction.next,
                    maxLength: 11,
                      enableSuggestions:false
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: '请输入密码',
                      labelText: '密码',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return '未输入密码';
                      }
                      if(value.length<6){
                        return '密码不能小于6位数';
                      }
                    },
                    obscureText: true,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted:  (String){
                      print('submit');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            GestureDetector(
              child: Container(
                width: double.infinity,
                child: Text("忘记密码",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              onTap: (){
                print("忘记密码");
                // Navigator.of(context).pushNamed("forgetPsd");
              },
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  // (_key.currentState as FormState).toString();
                  print((_key.currentState as FormState).validate());
                  // print("登录");
                  // Navigator.of(context).pushNamed("forgetPsd");
                },
                child: Text("登录"),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  print("注册");
                  // Navigator.of(context).pushNamed("forgetPsd");
                },
                  child: Text("注册")
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }
  void test() async{
    String result = await encodeString("content");
    print("result== $result");
    var s = await decrypt(result);
    print("s== $s");
  }
}
