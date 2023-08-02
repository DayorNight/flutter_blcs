import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/routes/pages.dart';
import 'package:flutter_blcs/widgets/flare_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FunctionPage extends BasePageStateWidget {
  static const  title = 'Flutter libs';

  @override
  String? get getTitle => S.current.hive_page_title;

  @override
  Widget? buildBody(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
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
                  title,
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
                    childCount: libPages.length),
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
    Color color = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: () {
        NavigatorUtils.fadePush(context, libPages.values.elementAt(index));
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
                tag: libPages.values.elementAt(index),
                child: FlareLogo(size: 100.r,color: Colors.white,)),
              SizedBox(
                height: 5,
              ),
              Text(
                libPages.keys.elementAt(index),
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
