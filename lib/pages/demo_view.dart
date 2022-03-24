import 'package:flutter/material.dart';

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  void reassemble() {
    super.reassemble();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('data'),
    );
  }
}
