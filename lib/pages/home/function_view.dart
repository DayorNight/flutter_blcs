import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/pages/pages.dart';
import 'package:google_fonts/google_fonts.dart';

class FunctionView extends StatefulWidget {
  const FunctionView({Key? key}) : super(key: key);

  @override
  _FunctionViewState createState() => _FunctionViewState();
}

class _FunctionViewState extends State<FunctionView> {
  String _title = 'Flutter libs';

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: FlareActor(Flares.logo,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      color: color,
                      animation: "Placeholder"),
                ),
                Text(
                  _title,
                  style: GoogleFonts.playfairDisplay(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 40,
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(_functionList,
                    childCount: myPages.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1)))
      ],
    );
  }

  /// 加载list
  Widget? _functionList(BuildContext context, int index) {
    var color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(myPages.values.elementAt(index));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: color, blurRadius: 10)],
          color: color,
          border: Border.all(
              color: color,
              width: 2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flag_rounded,
                color: Colors.white,
                size: 50,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                myPages.keys.elementAt(index),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
