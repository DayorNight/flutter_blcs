import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/widget/tabs_page.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String linearProgressIndicatorCode = '''
const LinearProgressIndicator(                                                            
	{Key? key,
	// 当前进度值
	double? value,
	// 进度条背景色
	Color? backgroundColor,
	// 进度条颜色                   
	Color? color,
	// 进度条颜色作为动画值
	Animation<Color?>? valueColor,
	// 进度条高度
	double? minHeight,
	// 语义标签
	String? semanticsLabel,
	// 语义值
	String? semanticsValue}
)
''';

class LinearProgressIndicatorPage extends StatefulWidget {
  static final String keys = "LinearProgressIndicatorPage";

  const LinearProgressIndicatorPage({Key? key}) : super(key: key);

  @override
  State<LinearProgressIndicatorPage> createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'LinearProgressIndicator',
      keys: LinearProgressIndicatorPage.keys,
      logoColor: Theme.of(context).primaryColor,
      des: "线性进度指示器",
      code: linearProgressIndicatorCode,
      footerChild: Column(
        children: [
          SizedBox(height: 20,),
          LinearProgressIndicator(
            value: controller.value,
            backgroundColor: Colors.grey,
            color: Colors.blue,
            minHeight: 15,
          ),
        ],
      ),
    );
  }
}
