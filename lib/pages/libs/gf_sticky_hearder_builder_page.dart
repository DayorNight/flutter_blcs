import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/components/sticky_header/gf_sticky_header.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class GFStickyHeaderBuilderPage extends BasePageStateWidget{
  static const keys = 'GFStickyHeaderBuilderPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => 'GFStickyHeaderBuilder';
  List imageList = ['asset images here'];
  @override
  Widget? buildBody(BuildContext context) {
    return ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) => GFStickyHeader(
          stickyContent: Container(
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF42335d),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Contact Group $index',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          content: Container(
            height: 300,
            child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        GFCheckboxListTile(
                          titleText: 'Eva Mendez',
                          subTitleText: 'Hello',
                          avatar: GFAvatar(
                            backgroundImage: AssetImage('asset image here'),
                          ),
                          size: 25,
                          activeBgColor: Colors.green,
                          activeIcon: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                          type: GFCheckboxType.circle,
                          onChanged: (val) {

                          },
                          value: false,
                          inactiveIcon: null,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Divider(),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ));

  }

}