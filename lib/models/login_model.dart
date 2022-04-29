import 'package:flutter_blcs/common/utils/rsa_utils.dart';
import 'package:flutter_blcs/http/dio_helper.dart';

Future loginModel(String user, String pass) async {
  String pas = await encodeString(pass);
  return await DioHelper.getInstance().http.post("/zxw/user", queryParameters: {
    "username": user,
    "password": pas,
  });
}

Future tokenLoginModel() async {
  return await DioHelper.getInstance().http.get("/zxw/user");
}
