import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String CircularProgressIndicatorCode = '''
const CircularProgressIndicator(                                                                
	{
		Key? key,
		// 当前进度值
		double? value,
		// 进度条背景色
		Color? backgroundColor,
		// 进度条颜色
		Color? color,
		// 进度条颜色作为动画值
		Animation<Color?>? valueColor,
		// 进度条高度
		double strokeWidth = 4.0,
		// 语义标签
		String? semanticsLabel,
		// 语义值
		String? semanticsValue
	}
)
''';
class CircularProgressIndicatorPage extends StatefulWidget {
  static final String keys = "CircularProgressIndicatorPage";

  @override
  State<CircularProgressIndicatorPage> createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage>  with TickerProviderStateMixin{
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

  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'CircularProgressIndicator',
      keys: CircularProgressIndicatorPage.keys,
      logoColor: Theme.of(context).primaryColor,
      des: "圆形进度指示器",
      code: CircularProgressIndicatorCode,
      footerChild: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            value: controller.value,
            backgroundColor: Colors.grey,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
