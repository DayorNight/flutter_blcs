import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDialogPage extends StatelessWidget {
  static final String keys = "AboutDialogPage";

  const AboutDialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'AboutDialogPage',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
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
      ),
    );
  }
}
