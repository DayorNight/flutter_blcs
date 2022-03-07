import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/comment_view.dart';
///注册页面
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  GlobalKey _key = GlobalKey<FormState>();
  var _sex = true;
  late TextEditingController _user;
  late TextEditingController _code;
  late TextEditingController _pass;
  late TextEditingController _time;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = TextEditingController();
    _code = TextEditingController();
    _pass = TextEditingController();
    _time = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _code.dispose();
    _pass.dispose();
    _time.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppBar("注册"),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            key: _key,
            child: Column(
              children: [
                TextFormField(
                  controller:_user,
                  keyboardType: TextInputType.phone,
                  maxLength: 11,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '请输入手机号',
                    icon : Text('手机账号'),
                    suffixIcon: ElevatedButton(
                      child: Text('发送验证码'),
                      onPressed: (){},
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value){
                    if(value ==null || value.isEmpty){
                      return '请输入手机号';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _code,
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
                    return null;
                  },
                ),
                TextFormField(
                  controller: _pass,
                  keyboardType: TextInputType.text,
                  maxLength: 11,
                  obscureText: true,
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
                    return null;
                  },
                ),
                Row(
                  children: [
                    Text("  性  别  "),
                    SizedBox(width: 12,),
                    Switch(value: _sex, onChanged: (change){
                      setState(() {
                        this._sex = change;
                      });
                    }),
                    Text("男"),
                  ],
                ),
                TextFormField(
                  controller: _time,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '请选择出生日期',
                    icon : Text('出生日期'),
                    suffixIcon: ElevatedButton(
                      onPressed: _selectTime,
                      child: Text('日期'),
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){_register();},
                      child: Text('注册')),
                )
              ],
            ),
        ),
      ),
    );
  }

  ///注册
  void _register(){
    print("user= ${_user.text}");
    print("code= ${_code.text}");
    print("pass= ${_pass.text}");
    print("time= ${_time.text}");
    print("sex= $_sex");
    Navigator.of(context).pop();
  }
  void _selectTime() async{
     DateTime? time = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
     print(time);
     if(time==null) return;
     var _date = "${time.year} - ${time.month} - ${time.day}";
     setState(() {
       _time.text = _date;
     });

  }
}
