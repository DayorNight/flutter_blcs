import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/json_demo.dart';
import 'package:flutter_blcs/bean/json_mul_demo.dart';
import 'package:flutter_blcs/models/json_parse_model.dart';
import '../../common/utils/code.dart';
import '../../generated/l10n.dart';
import '../../widgets/article_model.dart';

class JsonParsePage extends StatelessWidget{
  static final String keys = "JsonParsePage";
  const JsonParsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.of(context).customWidget,
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: jsonParseDes,
      code: jsonParseCode,
      footerChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<JsonDemo>(builder: _josnDemoUI,future: getJsonDemo(),),
          FutureBuilder<List<JsonDemo>>(builder: _josnListDemoUI,future: getJsonListDemo(),),
          FutureBuilder<JsonMulDemo>(builder: _josnMulDemoUI,future: getJsonMulDemo(),),
        ],
      ),
    );
  }

  Widget _josnDemoUI(BuildContext context, AsyncSnapshot<JsonDemo> snapshot) {
    if(snapshot.hasData){
      var json = jsonDemoToJson(snapshot.data!);
      return Text('解析一：$json');
    }else{
      return errorUI(snapshot.error);
    }
  }

  Widget _josnListDemoUI(BuildContext context, AsyncSnapshot<List<JsonDemo>> snapshot) {
    if(snapshot.hasData){
      var data = snapshot.data!;
      var str = data.map((e) => jsonDemoToJson(e)).toString();
      return Text('解析二：$str');
    }else{
      return errorUI(snapshot.error);
    }
  }

  Widget _josnMulDemoUI(BuildContext context, AsyncSnapshot<JsonMulDemo> snapshot) {
    if(snapshot.hasData){
      var jsonStr = jsonMulDemoToJson(snapshot.data!);
      return Text('解析三：$jsonStr');
    }else{
      return errorUI(snapshot.error);
    }
  }

  Center errorUI(Object? object) => Center(child: Text(object.toString()));
}
