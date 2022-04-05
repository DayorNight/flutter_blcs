import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/log_interceptor.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/static.dart';
import '../config/config.dart';
import '../generated/l10n.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  final FlutterErrorDetails details;

  ErrorPage(this.errorMessage, this.details);

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlareLogo(color: Colors.white,size: 300.r,),
          /*错误详情*/
          Config.DEBUG ? buildErrorDetailText():Text('ERROR',style: TextStyle(color: Colors.white,fontSize: 100.sp,decoration: null),),
          SizedBox(height:50.r,),
          /*按钮*/
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              /*上报*/
              OutlinedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {
                  //Todo 上报错误
                  println.e('上报错误');
                  // String content = widget.errorMessage;
                  // println.e(content);
                },
                child: Text(S.of(context).report),
              ),
              /*返回*/
              OutlinedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(S.of(context).back)),
            ],
          )
        ],
      ),
    );
  }

  Widget buildErrorDetailText() => Container(
    height: 0.65.sh,
    width: 0.8.sw,
    child: ListView(
      children: [
        Text(widget.errorMessage,style: TextStyle(color: Colors.white,fontSize: 15.sp)),
      ],
    ),
  );
}

