import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';
import 'package:flutter_blcs/view/home/function_view.dart';
import 'package:flutter_blcs/view/home/me_view.dart';
import 'package:flutter_blcs/view/home/weiget_view.dart';

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Demo"),
      body: PageView(
          controller: controller,
          onPageChanged: (index){},
          children: [
            WeigetView(),
            MeView(),
            FunctionView()
          ]
      ),
    );
  }
}
