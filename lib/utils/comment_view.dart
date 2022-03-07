import 'package:flutter/material.dart';

PreferredSizeWidget getAppBar(String title){
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
  );
}