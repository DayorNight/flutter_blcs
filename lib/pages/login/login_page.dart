import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/http/dio_helper.dart';
import 'package:flutter_blcs/pages/login/forget_psd_page.dart';
import 'package:flutter_blcs/pages/login/register_page.dart';
import 'package:flutter_blcs/pages/main/main_page.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/utils/navigator.dart';
import '../../common/weiget_util.dart';
///登录页面
class LoginPage extends StatefulWidget {
  static final String keys = "loginView";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _key = GlobalKey<FormState>();
  late TextEditingController _user;
  late TextEditingController _pass;

  @override
  void dispose() {
    super.dispose();
    _user.dispose();
    _pass.dispose();
  }

  @override
  void initState() {
    super.initState();
    _user = TextEditingController();
    _pass = TextEditingController();
    // loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    print(token);
    DioHelper.getInstance().http.options.headers["token"] = token;
    context.read<LoginViewModel>().tokenLogin(token!);
  }

  @override
  Widget build(BuildContext context) {
    screenInit(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar(context,"登录"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "static/images/ic_coffee.png",
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
                    controller: _user,
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
                      return null;
                    },
                    focusNode: FocusNode(
                        canRequestFocus: false //取消自动获取焦点
                    ),
                    textInputAction: TextInputAction.next,
                    maxLength: 11,
                    enableSuggestions:false,
                  ),
                  TextFormField(
                    controller: _pass,
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
                      return null;
                    },
                    focusNode: FocusNode(
                      canRequestFocus: false
                    ),
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
                NavigatorUtils.fadePush(context, ForgetPsdPage.keys);
              },
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:_login,
                child: Text("登录"),
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                child: Text("注册")
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() async{
    // var validate = (_key.currentState as FormState).validate();
    NavigatorUtils.fadePushAndRemove(context, MainPage.keys);
    // if(validate) {
    //   if (_user.text.isEmpty) {
    //     print("账号不能为空");
    //     return;
    //   } else if (_pass.text.isEmpty) {
    //     print("密码不能为空");
    //     return;
    //   }
    //   context.read<LoginViewModel>().login(_user.text,_pass.text);
    // }
  }

  void _register(){
    NavigatorUtils.fadePush(context, RegisterPage.keys);
  }

}
