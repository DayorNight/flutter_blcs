import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
///getAppBar
PreferredSizeWidget getAppBar(String title){
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
  );
}

///banner
Widget getBanner(List<String> datas) {
  return Swiper(
    itemBuilder: (BuildContext context, int index) {
      return Center(child: Text(datas[index],style: TextStyle(backgroundColor: Theme.of(context).backgroundColor),));
    },
    itemCount: 3,
    pagination: SwiperPagination(),
    control: SwiperControl(),
  );
}