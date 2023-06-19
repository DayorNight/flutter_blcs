import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class StepBarPage extends StatelessWidget {
  static const keys = 'StepBarPage';
  const StepBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
        logoColor: Theme.of(context).primaryColor,
        title: S.current.step_bar_title,
        keys: StepBarPage.keys,
        footerChild: Column(
          children: [
            commonButton(content: 'BrnHorizontalSteps', des: '横向步骤条一种常见的导航形式'),
            BrnHorizontalSteps(steps: [
              BrunoStep(
                stepContentText: "文案步骤",
              ),
              BrunoStep(
                stepContentText: "文案步骤",
              ),
              BrunoStep(
                stepContentText: "文案步骤",
              ),
              BrunoStep(
                stepContentText: "文案步骤",
              ),
            ],),
            commonButton(content: 'BrnStepLine', des: '垂直步骤条'),
            Text('第一个 Icon 为亮色'),
            ListView.builder(
              padding: EdgeInsets.only(top: 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return BrnStepLine(
                  lineWidth: 1,
                  //非第一个是灰色
                  isGrey: index !=0 ,
                  //最后一个的线条为透明色 做到不显示的效果
                  lineColor: Color(0xffeeeeee),
                  contentWidget: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '步骤${index + 1}',
                          style: TextStyle(
                            height: 0.9,
                            color: BrnThemeConfigurator.instance.getConfig().commonConfig.colorTextBase,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Text(
                            '辅助信息',
                            style: TextStyle(
                              color: BrnThemeConfigurator.instance.getConfig().commonConfig.colorTextSecondary,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Text('最后一个灰色'),
            ListView.builder(
              padding: EdgeInsets.only(top: 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return BrnStepLine(
                  lineWidth: 1,
                  //最后一个是灰色
                  isGrey: index == 2,
                  //最后一个的线条为透明色 做到不显示的效果
                  lineColor: index == 2 ? Colors.transparent : null,
                  highlightColor: BrnThemeConfigurator.instance.getConfig().commonConfig.brandPrimary,
                  contentWidget: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '步骤${index + 1}',
                          style: TextStyle(
                            height: 0.9,
                            color: BrnThemeConfigurator.instance.getConfig().commonConfig.colorTextBase,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Text(
                            '辅助信息',
                            style: TextStyle(
                              color: BrnThemeConfigurator.instance.getConfig().commonConfig.colorTextSecondary,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Text('线条颜色变化'),
            ListView.builder(
              padding: EdgeInsets.only(top: 20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return BrnStepLine(
                  lineWidth: 1,
                  //最后一个的线条为透明色 做到不显示的效果
                  lineColor: index == 2
                      ? Colors.transparent
                      : (index == 1
                      ? [
                    BrnThemeConfigurator.instance.getConfig().commonConfig.brandPrimary,
                    Colors.red
                  ]
                      : null),
                  highlightColor: index == 2
                      ? Colors.red
                      : BrnThemeConfigurator.instance.getConfig().commonConfig.brandPrimary,
                  contentWidget: Container(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '步骤${index + 1}',
                          style: TextStyle(
                            height: 0.9,
                            color: BrnThemeConfigurator.instance
                                .getConfig()
                                .commonConfig
                                .colorTextBase,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                            '辅助信息',
                            style: TextStyle(
                              color: BrnThemeConfigurator.instance
                                  .getConfig()
                                  .commonConfig
                                  .colorTextSecondary,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            Text('虚线模式'),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return BrnStepLine(
                  lineWidth: 1,
                  lineColor: <Color>[
                    BrnThemeConfigurator.instance.getConfig().commonConfig.brandPrimary,
                    Colors.red,
                  ],
                  isDashLine: true,
                  dashLength: 11,
                  contentWidget: Container(
                    height: 150,
                    color: Colors.indigo,
                  ),
                );
              },
            ),
          ],
        ));
  }


}
