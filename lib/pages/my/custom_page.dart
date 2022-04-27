import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPage extends StatelessWidget {
  static final String keys = "CustomPage";

  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = S.of(context).customWidget;
    return ArticleModel(
      title: title,
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: customWidgetDes,
      code: customWidgetCode,
      footerChild: Center(
        child: CustomPaint(
          size: Size(300.r, 300.r),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print('paint $size');
    print('paint ${Offset.zero}');
    var rect = Offset.zero & size;
    //绘制背景
    var paint = Paint()
      ..isAntiAlias = true //抗锯齿
      ..style = PaintingStyle.fill //填充类型
      ..color = Color(0xFFDCC48C); //颜色
    canvas.drawRect(rect, paint);
    //画横线
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black38
      ..strokeWidth = 1.0;
    for (int i = 0; i <= 3; ++i) {
      double dy = rect.top + rect.height / 3 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }
    //画竖线
    for (int i = 0; i <= 3; ++i) {
      double dx = rect.left + rect.width / 3 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
    //画圆
    paint.style = PaintingStyle.fill;
    for(int i = 0; i <= 8; ++i) {
      double dy = rect.height / 3 * (i%3) +rect.height/6;
      double dx = rect.width/3 * (i~/3) + rect.width/6;
      paint.color =(i%2==0)?Colors.black:Colors.white;
      canvas.drawCircle(Offset(dx, dy),rect.height/8, paint);
    }

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
