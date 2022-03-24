import 'package:flutter_blcs/common/utils/rsa_utils.dart';
import 'package:flutter_blcs/http/global.dart';

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
