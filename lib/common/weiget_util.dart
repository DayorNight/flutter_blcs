import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

///getAppBar
PreferredSizeWidget getAppBar(BuildContext context,String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

///banner
Widget getBanner(List<String> datas) {
  return Container(
    width: double.infinity,
    height: 150,
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: Colors.black54,
            alignment: Alignment.center,
            child: Text(
              datas[index],
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ));
      },
      itemCount: datas.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}

/// 输出文本
Widget printTxt(String content, {Color color = Colors.indigo}) {
  return Text(
    content,
    style: TextStyle(color: color),
  );
}

///高亮代码
Widget printCode(String content) {
  return SyntaxView(
    //代码
    code: content,
    //语言
    syntax: Syntax.DART,
    //主题
    syntaxTheme: SyntaxTheme.monokaiSublime(),
    //字体大小
    fontSize: 12,
    //启用缩放
    withZoom: true,
    //启用行号
    withLinesCount: true,
    //容器扩张
    expanded: false,
  );
}

///文章logo
Widget articleLogo(String key, Color color) {
  return Align(
    alignment: Alignment.topRight,
    child: Hero(
        tag: key,
        child: FlareLogo(
          size: 200.r,
          color: color,
        )),
  );
}

///提示
void showInSnackBar(BuildContext context,String message) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}

///共同按钮
OutlinedButton commonButton({Key? key,required String content,required String des,VoidCallback? onTop}) {
  return OutlinedButton(
      key: key,
      onPressed: onTop,
      child: SizedBox(
        width: 0.8.sw,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Text(
                  content,
                  style: TextStyle(fontSize: 30.sp),
                ),
                Text(
                  des,
                  style: TextStyle(fontSize: 20.sp,color: Colors.black26),
                ),
              ],
            ),
          ),
        ),
      ));
}