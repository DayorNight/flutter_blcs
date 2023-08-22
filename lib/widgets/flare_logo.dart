import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/assets.dart';

class FlareLogo extends StatelessWidget {
  final double? size;
  final Color? color;
  const FlareLogo({Key? key,this.size,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FlareActor(Assets.assetsFlareFlutterLogo,
          fit: BoxFit.fill,
          color: color,
          animation: "Placeholder"),
    );
  }
}
