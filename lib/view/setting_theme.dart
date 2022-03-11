import 'package:flutter/material.dart';
import 'package:flutter_blcs/global/global_theme.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingThemeView extends StatefulWidget {
  const SettingThemeView({Key? key}) : super(key: key);

  @override
  _SettingThemeViewState createState() => _SettingThemeViewState();
}

class _SettingThemeViewState extends State<SettingThemeView> {
  var _switchTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text("黑夜模式"),
                Switch(
                    value: _switchTheme,
                    onChanged: (value) {
                      setState(() {
                        this._switchTheme = value;
                      });
                    }),
              ],
            ),
            Visibility(
                visible: !_switchTheme,
                child: ListView.builder(
                  itemBuilder: _itemBuilder,
                  itemCount: themes.length,
                  shrinkWrap: true,
                ))
          ],
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: _switchTheme?darkThemes[index]:themes[index],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Provider.of<ThemeViewModel>(context).getColor == index
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end, //如何布局
                children: [
                  Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 16,
                  )
                ],
              )
            : Row(),
      ),
      onTap: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setInt("color", index);
        context.read<ThemeViewModel>().setColor(index);
      },
    );
  }
}
