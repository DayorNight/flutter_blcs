import 'package:flutter/material.dart';

class DrawListBean{
  late IconData icon;
  late String title;
  late IconData trailing;
  DrawListBean(IconData icon,String title,IconData trailing){
    this.icon = icon;
    this.title = title;
    this.trailing = trailing;
  }

}