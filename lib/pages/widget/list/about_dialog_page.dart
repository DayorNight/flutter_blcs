import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';

class AboutDialogPage extends BasePageWidget {
  static final String keys = "AboutDialogPage";

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => 'AboutDialogPage';


  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              showAboutDialog(context: context);
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.indigoAccent)),
            child: Text(
              "默认样式",
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: "Title",
                applicationVersion: "1.0.0",
                applicationLegalese: "Legalese",
                applicationIcon:Icon(Icons.insert_emoticon_rounded),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.indigoAccent)),
            child: Text(
              "配置参数",
              style: TextStyle(color: Colors.white),
            )),
        TextButton(
            onPressed: () {
              showAboutDialog(
                  context: context,
                  applicationName: "Title",
                  applicationVersion: "1.0.0",
                  applicationLegalese: "Legalese",
                  applicationIcon:Icon(Icons.insert_emoticon_rounded),
                  children: [
                    Text("widget1"),
                    Text("widget2"),
                    Text("widget3"),
                    Text("widget4"),
                    Text("widget5"),
                    Text("widget6"),
                  ]
              );
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.indigoAccent)),
            child: Text(
              "带widget",
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
