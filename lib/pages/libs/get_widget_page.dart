import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/pages/libs/gf_animation_page.dart';
import 'package:flutter_blcs/pages/libs/gf_bottom_sheet_page.dart';
import 'package:flutter_blcs/pages/libs/gf_drawer_page.dart';
import 'package:flutter_blcs/pages/libs/gf_sticky_hearder_builder_page.dart';
import 'package:flutter_blcs/pages/libs/gf_tab_bar_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_button_type.dart';

class GetWidgetPage extends BasePageStateWidget {
  static const keys = 'GetWidgetPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.get_widget_title;
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  final List<String> list = [
    "Flutter",
    "React",
    "Ionic",
    "Xamarin",
  ];

  final ValueNotifier<String?> notifier = ValueNotifier(null);


  @override
  Widget? buildBody(BuildContext context) {
    return ListView(
      children: [
        commonButton(
            content: 'GFButton',
            des: '按钮',
            onTop: () {
              _showWidget(context, getGFButton());
            }),
        commonButton(
            content: 'GFIconButton',
            des: '图标按钮',
            onTop: () {
              _showWidget(context, getGFIconButton());
            }),
        commonButton(
            content: 'GFBadge',
            des: '标签按钮',
            onTop: () {
              _showWidget(context, getGFBadge());
            }),
        commonButton(
            content: 'GFAvatar',
            des: '头像按钮',
            onTop: () {
              _showWidget(context, getGFAvatar());
            }),
        commonButton(
            content: 'GFImageOverlay',
            des: 'Image',
            onTop: () {
              _showWidget(context, getGFImageOverlay());
            }),
        commonButton(
            content: 'GFCard',
            des: 'Card',
            onTop: () {
              _showWidget(context, getGFCard(context));
            }),
        commonButton(
            content: 'GFCarousel',
            des: '旋转木马',
            onTop: () {
              _showWidget(context, getGFCarousel());
            }),
        commonButton(
            content: 'GFListTile',
            des: 'ListTile',
            onTop: () {
              _showWidget(context, getGFListTile());
            }),

        commonButton(
            content: 'GFFloatingWidget',
            des: 'FloatingWidget',
            onTop: () {
              _showWidget(context, getGFFloatingWidget(context));
            }),
        commonButton(
            content: 'GFToast',
            des: 'Toast',
            onTop: () {
              _showWidget(context, getGFToast(context));
            }),
        commonButton(
            content: 'GFToggle',
            des: 'Toggle',
            onTop: () {
              _showWidget(context, getGFToggle());
            }),
        commonButton(
            content: 'GFTypography',
            des: 'Typography',
            onTop: () {
              _showWidget(context, getGFTypography());
            }),

        commonButton(
            content: 'GFAccordion',
            des: 'Accordion',
            onTop: () {
              _showWidget(context, getGFAccordion());
            }),
        commonButton(
            content: 'GFAlert',
            des: 'Alert',
            onTop: () {
              _showWidget(context, getGFAlert());
            }),
        commonButton(
            content: 'GFSearchBar',
            des: 'SearchBar',
            onTop: () {
              _showWidget(context, getGFSearchBar());
            }),
        commonButton(
            content: 'GFRating',
            des: 'Rating',
            onTop: () {
              _showWidget(context, getGFRating());
            }),
        commonButton(
            content: 'GFDropdown',
            des: 'Dropdown',
            onTop: () {
              _showWidget(context, getGFDropdown());
            }),
        commonButton(
            content: 'GFLoader',
            des: 'Loader',
            onTop: () {
              _showWidget(context, getGFLoader());
            }),
        commonButton(
            content: 'GFProgressBar',
            des: 'ProgressBar',
            onTop: () {
              _showWidget(context, getGFProgressBar());
            }),
        commonButton(
            content: 'GFShimmer',
            des: '闪烁',
            onTop: () {
              _showWidget(context, getGFShimmer(context));
            }),

        commonButton(
            content: 'GFBorder',
            des: 'Border',
            onTop: () {
              _showWidget(context, getGFBorder(context));
            }),

        commonButton(
            content: 'GFCheckbox',
            des: 'Checkbox',
            onTop: () {
              _showWidget(context, getGFCheckbox());
            }),
        commonButton(
            content: 'GFCheckboxListTile',
            des: 'CheckboxListTile',
            onTop: () {
              _showWidget(context, getGFCheckboxListTile());
            }),
        commonButton(
            content: 'GFMultiSelect',
            des: 'MultiSelect',
            onTop: () {
              _showWidget(context, getGFMultiSelect());
            }),

        commonButton(
            content: 'GFRadio',
            des: 'Radio',
            onTop: () {
              _showWidget(context, getGFRadio());
            }),
        commonButton(
            content: 'GFRadioListTile',
            des: 'RadioListTile',
            onTop: () {
              _showWidget(context, getGFRadioListTile());
            }),
        commonButton(
            content: 'GFDrawer',
            des: 'Drawer',
            onTop: () {
              NavigatorUtils.fadePush(context, GFDrawerPage.keys);
            }),
        commonButton(
            content: 'GFTabBar',
            des: 'TabBar',
            onTop: () {
              NavigatorUtils.fadePush(context, GFTabBarPage.keys);
            }),
        commonButton(
            content: 'GFAnimationPage',
            des: 'Animation',
            onTop: () {
              NavigatorUtils.fadePush(context, GFAnimationPage.keys);
            }),
        commonButton(
            content: 'GFBottomSheet',
            des: 'BottomSheet',
            onTop: () {
              NavigatorUtils.fadePush(context, GFBottomSheetPage.keys);
            }),
        commonButton(
            content: 'GFStickyHeaderBuilder',
            des: 'StickyHeaderBuilder',
            onTop: () {
              NavigatorUtils.fadePush(context, GFStickyHeaderBuilderPage.keys);
            }),
      ],
    );
  }

  Future<void> _showWidget(BuildContext context, List<Widget> children) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              children: children,
            ),
          );
        });
  }

  List<Widget> getGFButton() {
    return [
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式1",
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式2",
        textStyle: TextStyle(
            color: Colors.red,
            fontSize: 38.sp,
            backgroundColor: Colors.white,
            fontWeight: FontWeight.bold),
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式3",
        type: GFButtonType.solid,
        boxShadow: BoxShadow(
            color: Colors.red,
            offset: Offset(0, 3),
            blurRadius: 0,
            spreadRadius: 5,
            blurStyle: BlurStyle.normal),
      ),
      GFButton(
          onPressed: () => println.e("=========="), text: "样式4", elevation: 5),
      GFButton(
          onPressed: () => println.e("=========="),
          text: "样式5",
          borderShape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 5))),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式6",
        type: GFButtonType.transparent,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式7",
        type: GFButtonType.outline,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式8",
        type: GFButtonType.outline2x,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式9",
        shape: GFButtonShape.pills,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式10",
        shape: GFButtonShape.square,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式11",
        color: Colors.grey,
        textColor: Colors.red,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式12",
        icon: Icon(Icons.add),
        position: GFPosition.start,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式13",
        icon: Icon(Icons.add),
        position: GFPosition.end,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式14",
        size: GFSize.SMALL,
      ),
      GFButton(
        onPressed: () => println.e("=========="),
        text: "样式15",
        size: GFSize.LARGE,
      ),
      GFButton(
        onPressed: () {},
        text: "primary",
        blockButton: true,
      ),
      GFButton(
        onPressed: () {},
        text: "primary",
        fullWidthButton: true,
      ),
    ];
  }

  List<Widget> getGFIconButton() {
    return [
      GFIconButton(icon: Icon(Icons.add), onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(icon: Icon(Icons.add), size: GFSize.LARGE, onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(icon: Icon(Icons.add), iconSize: 38, onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add), padding: EdgeInsets.all(20), onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add), type: GFButtonType.outline2x, onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add), type: GFButtonType.outline, onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add),
          type: GFButtonType.transparent,
          onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add),
          shape: GFIconButtonShape.square,
          onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add),
          shape: GFIconButtonShape.pills,
          onPressed: null),
      SizedBox(
        height: 10,
      ),
      GFIconButton(
          icon: Icon(Icons.add),
          shape: GFIconButtonShape.circle,
          onPressed: null)
    ];
  }

  List<Widget> getGFBadge() {
    return [
      GFBadge(text: '12', size: GFSize.LARGE),
      SizedBox(
        height: 10,
      ),
      GFBadge(
        text: '12',
        size: GFSize.LARGE,
        shape: GFBadgeShape.circle,
      ),
      SizedBox(
        height: 10,
      ),
      GFBadge(
        text: '12',
        size: GFSize.LARGE,
        shape: GFBadgeShape.pills,
      ),
      SizedBox(
        height: 10,
      ),
      GFBadge(
        text: '12',
        size: GFSize.LARGE,
        shape: GFBadgeShape.square,
      ),
      SizedBox(
        height: 10,
      ),
      GFIconBadge(
        child: GFIconButton(
          onPressed: () {},
          icon: Icon(Icons.ac_unit),
        ),
        counterChild: GFBadge(
          child: Text("12"),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFButtonBadge(
        onPressed: () {},
        text: 'primary',
        icon: GFBadge(
          child: Text("12"),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFButtonBadge(
        onPressed: () {},
        text: "primary",
        icon: GFBadge(
          child: Text("12"),
        ),
        type: GFButtonType.outline,
      ),
    ];
  }

  List<Widget> getGFAvatar() {
    return [
      GFAvatar(
        backgroundImage: AssetImage(Assets.imagesIcAvator),
      ),
      SizedBox(
        height: 10,
      ),
      GFAvatar(
        backgroundImage: AssetImage(Assets.imagesIcAvator),
        shape: GFAvatarShape.standard,
      ),
      SizedBox(
        height: 10,
      ),
      GFAvatar(
        backgroundImage: AssetImage(Assets.imagesIcAvator),
        shape: GFAvatarShape.square,
      ),
      SizedBox(
        height: 10,
      ),
      GFAvatar(
        backgroundImage: AssetImage(Assets.imagesIcAvator),
        radius: 40,
      ),
      SizedBox(
        height: 10,
      ),
      GFAvatar(backgroundColor: Colors.indigo, size: GFSize.SMALL),
      SizedBox(
        height: 10,
      ),
      GFAvatar(
          child: Text("data"),
          backgroundColor: Colors.indigo,
          size: GFSize.LARGE),
    ];
  }

  List<Widget> getGFImageOverlay() {
    return [
      GFImageOverlay(
          height: 100, width: 100, image: AssetImage(Assets.imagesIcAvator)),
      SizedBox(
        height: 10,
      ),
      GFImageOverlay(
        height: 100,
        width: 100,
        child: Center(
          child: Text('Text', style: TextStyle(color: GFColors.LIGHT)),
        ),
        image: AssetImage(Assets.imagesIcAvator),
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.3), BlendMode.darken),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      SizedBox(
        height: 10,
      ),
      GFImageOverlay(
        height: 100,
        width: 100,
        shape: BoxShape.circle,
        image: AssetImage(Assets.imagesIcAvator),
        boxFit: BoxFit.cover,
      )
    ];
  }

  List<Widget> getGFCard(BuildContext context) {
    return [
      GFCard(
        boxFit: BoxFit.cover,
        image: Image.asset(Assets.imagesIcAvator),
        title: GFListTile(
          avatar: GFAvatar(
            backgroundImage: AssetImage(Assets.imagesIcAvator),
          ),
          title: Text('Card Title'),
          subTitle: Text('Card Sub Title'),
        ),
        content: Text("Some quick example text to build on the card"),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFButton(
              onPressed: () {},
              text: 'Buy',
            ),
            GFButton(
              onPressed: () {},
              text: 'Cancel',
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        image: Image.asset(
          Assets.imagesLaunchImage,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        showImage: true,
        title: GFListTile(
          avatar: GFAvatar(
            backgroundImage: AssetImage(Assets.imagesIcAvator),
          ),
          titleText: 'Game Controllers',
          subTitleText: 'PlayStation 4',
        ),
        content: Text("Some quick example text to build on the card"),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFAvatar(
              backgroundColor: GFColors.PRIMARY,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
            GFAvatar(
              backgroundColor: GFColors.SECONDARY,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            GFAvatar(
              backgroundColor: GFColors.SUCCESS,
              child: Icon(
                Icons.phone,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        showOverlayImage: true,
        imageOverlay: AssetImage(Assets.imagesIcAvator),
        title: GFListTile(
          avatar: GFAvatar(),
          titleText: 'Game Controllers',
          subTitleText: 'PlayStation 4',
        ),
        content: Text("Some quick example text to build on the card"),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFAvatar(
              backgroundColor: GFColors.PRIMARY,
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> getGFCarousel() {
    return [
      GFCarousel(
        items: imageList.map(
          (url) {
            return Container(
              margin: EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
              ),
            );
          },
        ).toList(),
        onPageChanged: (index) {},
      ),
      SizedBox(
        height: 10,
      ),
      GFItemsCarousel(
        rowCount: 3,
        children: imageList.map(
          (url) {
            return Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(url, fit: BoxFit.cover, width: 1000.0),
              ),
            );
          },
        ).toList(),
      ),
    ];
  }

  List<Widget> getGFListTile() {
    return [
      GFListTile(
          titleText: 'Title',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          icon: Icon(Icons.favorite)),
      SizedBox(
        height: 10,
      ),
      GFListTile(
          avatar: GFAvatar(),
          titleText: 'Title',
          subTitleText: 'Lorem ipsum dolor sit amet, consectetur adipiscing',
          icon: Icon(Icons.favorite)),
    ];
  }


  List<Widget> getGFFloatingWidget(BuildContext context) {
    return [
      GFFloatingWidget(child: Text('This'), body: Text('body')),
      SizedBox(
        height: 10,
      ),
      GFFloatingWidget(
        child: GFIconBadge(
            child: GFAvatar(
              size: GFSize.LARGE,
              backgroundImage: AssetImage(Assets.imagesIcAvator),
            ),
            counterChild: GFBadge(
              text: '12',
              shape: GFBadgeShape.circle,
            )),
        body: Text('body'),
        verticalPosition: MediaQuery.of(context).size.height * 0.2,
        horizontalPosition: MediaQuery.of(context).size.width * 0.8,
      )
    ];
  }

  List<Widget> getGFToast(BuildContext context) {
    return [
      InkWell(
        child: Text('1'),
        onTap: () => GFToast.showToast(
          'Text 1',
          context,
        ),
      ),
      SizedBox(
        height: 20,
      ),
      InkWell(
        child: Text('2'),
        onTap: () => GFToast.showToast('Text 2', context,
            toastPosition: GFToastPosition.BOTTOM,
            textStyle: TextStyle(fontSize: 16, color: GFColors.DARK),
            backgroundColor: GFColors.LIGHT,
            trailing: Icon(
              Icons.notifications,
              color: GFColors.SUCCESS,
            )),
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  List<Widget> getGFToggle() {
    return [
      GFToggle(
        onChanged: (val) {
          println.e("val = $val");
        },
        value: true,
      ),
      SizedBox(
        height: 20,
      ),
      GFToggle(
        onChanged: (val) {},
        value: true,
        type: GFToggleType.ios,
      ),
      SizedBox(
        height: 20,
      ),
      GFToggle(
        onChanged: (val) {},
        value: true,
        type: GFToggleType.square,
      ),
      SizedBox(
        height: 20,
      ),
      GFToggle(
        onChanged: (val) {},
        value: true,
        type: GFToggleType.custom,
      ),
      SizedBox(
        height: 20,
      ),
      GFToggle(
        onChanged: (val) {},
        value: true,
        type: GFToggleType.ios,
        enabledText: 'yes',
        enabledThumbColor: Colors.deepPurple,
        enabledTrackColor: Colors.red,
        disabledText: 'no',
        disabledThumbColor: Colors.lightBlue,
        disabledTrackColor: Colors.cyanAccent,
      ),
    ];
  }

  List<Widget> getGFTypography() {
    return [
      GFTypography(
        text: '模版1',
      ),
      SizedBox(
        height: 10,
      ),
      GFTypography(
        text: '模版2',
        type: GFTypographyType.typo1,
      ),
      SizedBox(
        height: 10,
      ),
      GFTypography(
        text: '模版3',
        type: GFTypographyType.typo1,
        icon: Icon(Icons.send),
      ),
      SizedBox(
        height: 10,
      ),
      GFTypography(
        text: '模版4',
        type: GFTypographyType.typo1,
        icon: Icon(Icons.send),
        backgroundImage: AssetImage(Assets.imagesIcAvator),
      ),
    ];
  }

  List<Widget> getGFDrawer() {
    return [
      GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GFDrawerHeader(
              currentAccountPicture: GFAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
              ),
              otherAccountsPictures: <Widget>[
                Image(
                  image: NetworkImage(
                      "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                  fit: BoxFit.cover,
                ),
                GFAvatar(
                  child: Text("ab"),
                )
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('user name'),
                  Text('user@userid.com'),
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: null,
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: null,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> getGFAccordion() {
    return [
      GFAccordion(
          title: 'GF Accordion',
          content:
              'GetFlutter is an open source library that comes with pre-build 1000+ UI components.'),
      SizedBox(
        height: 10,
      ),
      GFAccordion(
          title: 'GF Accordion',
          content:
              'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
          collapsedIcon: Icon(Icons.add),
          expandedIcon: Icon(Icons.minimize)),
      SizedBox(
        height: 10,
      ),
      GFAccordion(
          title: 'GF Accordion',
          content:
              'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
          collapsedIcon: Text('Show'),
          expandedIcon: Text('Hide')),
    ];
  }

  List<Widget> getGFAlert() {
    return [
      GFAlert(
        alignment: Alignment.center,
        backgroundColor: Colors.white,
        title: 'Welcome!',
        content:
            'Get Flutter is one of the largest Flutter open-source UI library for mobile or web apps with  1000+ pre-built reusable widgets.',
        type: GFAlertType.rounded,
        bottombar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GFButton(
              onPressed: () {},
              color: GFColors.LIGHT,
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFAlert(
        title: "GFAlert",
      )
    ];
  }

  List<Widget> getGFSearchBar() {
    return [
      GFSearchBar<String>(
        searchList: list,
        searchQueryBuilder: (query, list) {
          return list
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
        },
        overlaySearchListItemBuilder: (item) {
          return Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              item,
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        onItemSelected: (item) {},
      ),
    ];
  }

  List<Widget> getGFRating() {
    return [
      GFRating(
        value: 3,
        onChanged: (value) {},
      ),
    ];
  }

  List<Widget> getGFDropdown() {
    return [
      GFDropdown(
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(5),
        border: const BorderSide(color: Colors.black12, width: 1),
        dropdownButtonColor: Colors.white,
        value: 'Villareal',
        onChanged: (newValue) {},
        items: ['FC Barcelona', 'Real Madrid', 'Villareal', 'Manchester City']
            .map((value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
            .toList(),
      ),
      SizedBox(
        height: 300,
      )
    ];
  }

  List<Widget> getGFLoader() {
    return [
      GFLoader(type: GFLoaderType.ios),
      SizedBox(
        height: 10,
      ),
      GFLoader(type: GFLoaderType.circle),
      SizedBox(
        height: 10,
      ),
      GFLoader(type: GFLoaderType.square),
      SizedBox(
        height: 10,
      ),
      GFLoader(
          type: GFLoaderType.custom,
          child: Image(
            image: AssetImage(Assets.imagesIcAvator),
          )),
      SizedBox(
        height: 10,
      ),
      GFLoader(
        type: GFLoaderType.custom,
        loaderIconOne: Icon(Icons.insert_emoticon),
        loaderIconTwo: Icon(Icons.insert_emoticon),
        loaderIconThree: Icon(Icons.insert_emoticon),
      ),
      SizedBox(
        height: 10,
      ),
      GFLoader(
        type: GFLoaderType.custom,
        loaderIconOne: Text('Please'),
        loaderIconTwo: Text('Wait'),
        loaderIconThree: Text('a moment'),
      ),
    ];
  }

  List<Widget> getGFProgressBar() {
    return [
      GFProgressBar(
          percentage: 0.9,
          backgroundColor: Colors.black26,
          progressBarColor: GFColors.DANGER),
      SizedBox(
        height: 30,
      ),
      GFProgressBar(
          percentage: 0.9,
          width: 100,
          radius: 50,
          type: GFProgressType.circular,
          backgroundColor: Colors.black26,
          progressBarColor: GFColors.DANGER),
      SizedBox(
        height: 30,
      ),
      GFProgressBar(
        percentage: 0.5,
        lineHeight: 20,
        child: const Padding(
          padding: EdgeInsets.only(right: 5),
          child: Text(
            '50%',
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black26,
        progressBarColor: GFColors.WARNING,
      ),
      SizedBox(
        height: 10,
      ),
      GFProgressBar(
        percentage: 0.8,
        lineHeight: 20,
        alignment: MainAxisAlignment.spaceBetween,
        child: const Text(
          '80%',
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        leading: Icon(Icons.sentiment_dissatisfied, color: GFColors.DANGER),
        trailing: Icon(Icons.sentiment_satisfied, color: GFColors.SUCCESS),
        backgroundColor: Colors.black26,
        progressBarColor: GFColors.INFO,
      )
    ];
  }

  List<Widget> getGFShimmer(BuildContext context) {
    return [
      GFShimmer(
        child: const Text(
          'GF Shimmer',
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
        ),
        showGradient: true,
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.centerLeft,
          stops: const <double>[0, 0.3, 0.6, 0.9, 1],
          colors: [
            Colors.teal.withOpacity(0.1),
            Colors.teal.withOpacity(0.3),
            Colors.teal.withOpacity(0.5),
            Colors.teal.withOpacity(0.7),
            Colors.teal.withOpacity(0.9),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      GFShimmer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 46,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 8,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 8,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 8,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> getGFAnimation() {
    return [
    // AnimationController controller =
    //     AnimationController(duration: const Duration(seconds: 5), vsync: this);
    // Animation<double> animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    // controller.repeat();

    //   GestureDetector(
    //     onTap: () {
    //       controller.repeat();
    //     },
    //     child: GFAnimation(
    //       turnsAnimation: animation,
    //       controller: controller,
    //       type: GFAnimationType.rotateTransition,
    //       alignment: Alignment.center,
    //       child: Image.asset(
    //         'assets image here',
    //         width: 80,
    //         height: 80,
    //       ),
    //     ),
    //   ),
    ];
  }

  List<Widget> getGFBorder(BuildContext context) {
    return [
      GFBorder(
        color: Color(0xFF19CA4B),
        dashedLine: [2, 0],
        type: GFBorderType.rect,
        child: Image.asset(
          Assets.imagesIcAvator,
          width: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(height: 10,),
      GFBorder(
        dashedLine: [4, 6],
        type: GFBorderType.rect,
        color: Color(0xFF19CA4B),
        child: Image.asset(
          Assets.imagesIcAvator,
          width: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(height: 10,),
      GFBorder(
        color: Color(0xFF19CA4B),
        dashedLine: [2, 1],
        type: GFBorderType.rect,
        child: Image.asset(
          Assets.imagesIcAvator,
          width: 200,
          fit: BoxFit.fitWidth,
        ),
      ),
      SizedBox(height: 10,),
      GFBorder(
        color: Color(0xFF19CA4B),
        dashedLine: [2, 0],
        type: GFBorderType.rect,
        child: Container(
          height: 100,
          color: Color(0xFFE9FFEF),
        ),
      ),
      SizedBox(height: 10,),
      GFBorder(
        radius: Radius.circular(20),
        color: Color(0xFF19CA4B),
        dashedLine: [2, 0],
        type: GFBorderType.rRect,
        child: Container(
          height: 100,
          color: Color(0xFFE9FFEF),
        ),
      ),
      SizedBox(height: 10,),
      GFBorder(
        type: GFBorderType.oval,
        dashedLine: [2, 0],
        color: Color(0xFF19CA4B),
        strokeWidth: 2,
        child: Center(child: Text('Oval Border')),
      ),
      SizedBox(height: 10,),
      GFBorder(
        type: GFBorderType.circle,
        dashedLine: [4, 6],
        color: Color(0xFF19CA4B),
        strokeWidth: 2,
        child: Center(
            child: Text(
              'Circular Border',
              textAlign: TextAlign.center,
            )),
      ),
    ];
  }

  List<Widget> getGFBottomSheet() {
    return [];
  }

  List<Widget> getGFCheckbox() {
    return [
      GFCheckbox(
        size: GFSize.SMALL,
        activeBgColor: GFColors.DANGER,
        onChanged: (value) {
        },
        value: true,
      ),
      GFCheckbox(
        size: GFSize.SMALL,
        activeBgColor: GFColors.DANGER,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        activeBgColor: GFColors.SECONDARY,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        size: GFSize.LARGE,
        activeBgColor: GFColors.SUCCESS,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        size: GFSize.SMALL,
        activeBgColor: GFColors.DANGER,
        type: GFCheckboxType.square,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        type: GFCheckboxType.square,
        activeBgColor: GFColors.SECONDARY,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        size: GFSize.LARGE,
        activeBgColor: GFColors.SUCCESS,
        type: GFCheckboxType.square,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
      GFCheckbox(
        size: GFSize.SMALL,
        type: GFCheckboxType.custom,
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
    ];
  }

  List<Widget> getGFCheckboxListTile() {
    return [
      GFCheckboxListTile(
        titleText: 'Arthur Shelby',
        subTitleText: 'By order of the peaky blinders',
        avatar: GFAvatar(
          backgroundImage: AssetImage(Assets.imagesIcAvator),
        ),
        size: 25,
        activeBgColor: Colors.green,
        type: GFCheckboxType.circle,
        activeIcon: Icon(
          Icons.check,
          size: 15,
          color: Colors.white,
        ),
        onChanged: (value) {
        },
        value: true,
        inactiveIcon: null,
      ),
    ];
  }

  List<Widget> getGFMultiSelect() {
    return [
      GFMultiSelect(
        items: list,
        onSelect: (value) {
          print('selected $value ');
        },
        dropdownTitleTileText: 'Messi, Griezmann, Coutinho ',
        dropdownTitleTileMargin: EdgeInsets.only(
            top: 22, left: 18, right: 18, bottom: 5),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownUnderlineBorder:
        const BorderSide(color: Colors.transparent, width: 2),
        dropdownTitleTileBorder:
        Border.all(color:  Colors.grey.withAlpha(200), width: 1),
        dropdownTitleTileBorderRadius: BorderRadius.circular(5),
        expandedIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        collapsedIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.black54,
        ),
        submitButton: Text('OK'),
        cancelButton: Text('Cancel'),
        dropdownTitleTileTextStyle:
        const TextStyle(fontSize: 14, color: Colors.black54),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(6),
        type: GFCheckboxType.basic,
        activeBgColor: GFColors.SUCCESS,
        activeBorderColor: GFColors.SUCCESS,
        inactiveBorderColor: Colors.grey.withAlpha(200),
      ),
      SizedBox(height: 10,),
      GFMultiSelect(
        items: list,
        onSelect: (value) {
          print('selected $value ');
        },
        dropdownTitleTileText: 'Messi, Griezmann, Coutinho ',
        dropdownTitleTileColor: Colors.grey[200],
        dropdownTitleTileMargin: EdgeInsets.only(
            top: 22, left: 18, right: 18, bottom: 5),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownUnderlineBorder: const BorderSide(
            color: Colors.transparent, width: 2),
        dropdownTitleTileBorder:
        Border.all(color: Colors.grey, width: 1),
        dropdownTitleTileBorderRadius: BorderRadius.circular(5),
        expandedIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        collapsedIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.black54,
        ),
        submitButton: Text('OK'),
        dropdownTitleTileTextStyle: const TextStyle(
            fontSize: 14, color: Colors.black54),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(6),
        type: GFCheckboxType.basic,
        activeBgColor: Colors.green.withOpacity(0.5),
        inactiveBorderColor: Colors.grey,
      ),
    ];
  }

  List<Widget> getGFRadio() {
    return [
      GFRadio(
        size: GFSize.SMALL,
        value: 2,
        groupValue: 0,
        onChanged: (value) {
        },
        inactiveIcon: null,
        activeBorderColor: GFColors.SUCCESS,
        radioColor: GFColors.SUCCESS,
      ),
      SizedBox(height: 10,),
      GFRadio(
        size: GFSize.LARGE,
        activeBorderColor: GFColors.SUCCESS,
        value: 0,
        groupValue: 0,
        onChanged: (val) {
        },
        inactiveIcon: null,
        radioColor: GFColors.SUCCESS,
      ),
      SizedBox(height: 10,),
      GFRadio(
        size: GFSize.MEDIUM,
        value: 1,
        groupValue: 1,
        onChanged: (value) {
        },
        inactiveIcon: null,
        activeBorderColor: GFColors.SUCCESS,
        radioColor: GFColors.SUCCESS,
      ),
      SizedBox(height: 10,),
      GFRadio(
        size: GFSize.SMALL,
        value: 2,
        groupValue: 1,
        onChanged: (value) {
        },
        inactiveIcon: null,
        activeBorderColor: GFColors.SUCCESS,
        radioColor: GFColors.SUCCESS,
      ),
      SizedBox(height: 10,),
      GFRadio(
        size: 20,
        value: 3,
        groupValue: 1,
        onChanged: (value) {
        },
        inactiveIcon: null,
        activeBorderColor: GFColors.SUCCESS,
        radioColor: GFColors.SUCCESS,
      )
    ];
  }

  List<Widget> getGFRadioListTile() {
    return [
      GFRadioListTile(
        titleText: 'Arthur Shelby',
        subTitleText: 'By order of the peaky blinders',
        avatar: GFAvatar(
          backgroundImage: AssetImage(Assets.imagesIcAvator),
        ),
        size: 25,
        activeBorderColor: Colors.green,
        focusColor: Colors.green,
        type: GFRadioType.square,
        value: 0,
        groupValue: 1,
        onChanged: (value) {
        },
        inactiveIcon: null,
      ),
      SizedBox(height: 10,),
      GFRadioListTile(
        titleText: 'Arthur Shelby',
        subTitle: Text('By order of the peaky blinders'),
        avatar: GFAvatar(
          backgroundImage: AssetImage(Assets.imagesIcAvator),
        ),
        size: 25,
        activeBorderColor: Colors.green,
        focusColor: Colors.green,
        type: GFRadioType.square,
        value: 1,
        groupValue: 0,
        onChanged: (value) {
        },
        inactiveIcon: null,
      ),
    ];
  }

}
