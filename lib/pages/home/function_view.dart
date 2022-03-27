import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blcs/pages/pages.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FunctionView extends StatefulWidget {
  const FunctionView({Key? key}) : super(key: key);

  @override
  _FunctionViewState createState() => _FunctionViewState();
}

class _FunctionViewState extends State<FunctionView> {
  String _title = 'Flutter libs';
  Color color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    color = Theme.of(context).primaryColor;
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlareLogo(size: 120.r,color: color,),
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
                    childCount: LibPages.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1)))
      ],
    );
  }

  /// 加载list
  Widget? _functionList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(LibPages.values.elementAt(index));
      },
      child:Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: color, blurRadius: 10)],
          color: color,
          border:
          Border.all(color: color, width: 2, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: LibPages.values.elementAt(index),
                child: FlareLogo(size: 100.r,color: Colors.white,)),
              SizedBox(
                height: 5,
              ),
              Text(
                LibPages.keys.elementAt(index),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, overflow: TextOverflow.ellipsis),
                maxLines: 1,
                softWrap: true,
              )
            ],
          ),
        ),
      ),
      // child: Hero(
      //     tag: LibPages.values.elementAt(index),
      //     child: ),
    );
  }
}
