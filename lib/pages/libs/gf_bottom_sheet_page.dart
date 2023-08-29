import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/bottom_sheet/gf_bottom_sheet.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

class GFBottomSheetPage extends BasePageStateWidget{
  static const keys = 'GFBottomSheetPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => 'GFBottomSheet';

  late GFBottomSheetController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    controller = GFBottomSheetController();
  }

  @override
  Widget? buildBody(BuildContext context) {
    // return GFBottomSheet(
    //   controller: controller,
    //   maxContentHeight: 300,
    //   enableExpandableContent: true,
    //   stickyHeaderHeight: 100,
    //   stickyHeader: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]),
    //     child: const GFListTile(
    //       avatar: GFAvatar(
    //         backgroundImage: AssetImage(Assets.imagesIcAvator),
    //       ),
    //       titleText: 'Eva Mendez',
    //       subTitleText: '11 minutes ago',
    //     ),
    //   ),
    //   contentBody: SingleChildScrollView(
    //     child: Container(
    //       margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //       child: Column(
    //         children: [
    //           Container(
    //             margin: EdgeInsets.symmetric(horizontal: 15),
    //             child: Row(
    //               children: <Widget>[
    //                 Container(
    //                   width: 30,
    //                   height: 30,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(50),
    //                       image: DecorationImage(
    //                           image: AssetImage(Assets.imagesIcAvator))),
    //                 ),
    //                 Container(
    //                     margin: EdgeInsets.only(left: 6),
    //                     child: Text(
    //                       'Add to your story',
    //                       style: TextStyle(color: Colors.blue),
    //                     ))
    //               ],
    //             ),
    //           ),
    //           ListView.builder(
    //               physics: ScrollPhysics(),
    //               shrinkWrap: true,
    //               scrollDirection: Axis.vertical,
    //               itemCount: 3,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return SingleChildScrollView(
    //                     child: InkWell(
    //                       child: GFListTile(
    //                         avatar: GFAvatar(
    //                           backgroundImage:
    //                           AssetImage(Assets.imagesIcAvator),
    //                           size: 20,
    //                         ),
    //                         subTitleText: 'John Mendez',
    //                         icon: Container(
    //                           width: 66,
    //                           height: 30,
    //                           child: GFButton(
    //                             onPressed: () {},
    //                             color: Colors.lightBlue,
    //                             child: Center(
    //                                 child: Text(
    //                                   'Send',
    //                                   style: TextStyle(color: Colors.white),
    //                                 )),
    //                           ),
    //                         ),
    //                       ),
    //                     ));
    //               }),
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      bottomSheet: GFBottomSheet(
        controller: controller,
        maxContentHeight: 150,
        stickyHeaderHeight: 100,
        stickyHeader: Container(
          decoration: BoxDecoration(color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 0)]
          ),
          child: const GFListTile(
            avatar: GFAvatar(
              backgroundImage: AssetImage(Assets.imagesIcAvator),
            ),
            titleText: 'GetWidget',
            subTitleText: 'Open source UI library',
          ),
        ),
        contentBody: Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: const [
              Center(
                  child: Text(
                    'Getwidget reduces your overall app development time to minimum 30% because of its pre-build clean UI widget that you can use in flutter app development. We have spent more than 1000+ hours to build this library to make flutter developer’s life easy.',
                    style: TextStyle(
                        fontSize: 15, wordSpacing: 0.3, letterSpacing: 0.2),
                  ))
            ],
          ),
        ),
        stickyFooter: Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Get in touch',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'info@getwidget.dev',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        stickyFooterHeight: 50,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child: controller.isBottomSheetOpened ? Icon(Icons.keyboard_arrow_down):Icon(Icons.keyboard_arrow_up),
          onPressed: () {
            controller.isBottomSheetOpened
                ? controller.hideBottomSheet()
                : controller.showBottomSheet();
          }
      ),
    );
  }
}