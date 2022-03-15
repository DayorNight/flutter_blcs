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

  @override
  void initState() {
    super.initState();
  }

  final PageController controller = PageController();

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'H', 'G','I','J',];
  final List<int> colorCodes = <int>[900, 800,700,600,500,400,300,200,100,0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Demo"),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              }
          )
        ],
      ),
    );
  }
}
