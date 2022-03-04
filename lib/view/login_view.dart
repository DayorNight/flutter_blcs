import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/rsa_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登陆"),
        centerTitle: true,
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '输入账号'
                    ),
                    validator: (String? value){
                      if(value == null || value.isEmpty){
                        return '未输入账号';
                      }
                      return null;
                    },
                  )
                ],
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
