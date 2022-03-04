import 'dart:convert';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter_blcs/utils/rsa_data.dart';

///RSA 分段加密
Future<String> encodeString(String content) async{
  var publickey = RSAKeyParser().parse(pubKey) as RSAPublicKey;
  final encrypter = Encrypter(RSA(publicKey: publickey));
  List<int> sourceBytes = utf8.encode(content);
  int inputLen = sourceBytes.length;
  int maxLen = 117;
  List<int> totalBytes = [];
  for(var i=0; i<inputLen;i+=maxLen){
    int endLen = inputLen -i;
    List<int> item;
    if(endLen > maxLen){
      item = sourceBytes.sublist(i,i+maxLen);
    }else{
      item = sourceBytes.sublist(i,i+endLen);
    }
    totalBytes.addAll(encrypter.encryptBytes(item).bytes);
  }
  return base64.encode(totalBytes);
}

/// 解密
Future<String> decrypt(String content) async{
  var prikey = RSAKeyParser().parse(priKey) as RSAPrivateKey;
  final encrypter = Encrypter(RSA(privateKey: prikey));
  return encrypter.decrypt(Encrypted.from64(content));
}