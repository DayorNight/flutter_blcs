import 'package:flutter_blcs/global/global.dart';
import 'package:flutter_blcs/utils/rsa_utils.dart';

Future loginModel(String user, String pass) async {
  String pas = await encodeString(pass);
  return await Global.getInstance().dio.post("/zxw/user", queryParameters: {
    "username": user,
    "password": pas,
  });
}

Future tokenLoginModel() async {
  return await Global.getInstance().dio.get("/zxw/user");
}
