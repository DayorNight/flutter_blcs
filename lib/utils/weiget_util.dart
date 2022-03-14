import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

///getAppBar
PreferredSizeWidget getAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 10,
  );
}

///banner
Widget getBanner(List<String> datas) {
  return Container(
    width: double.infinity,
    height: 200,
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
            color: Colors.black54,
            alignment: Alignment.center,
            child: Text(
              datas[index],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ));
      },
      itemCount: datas.length,
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
  );
}
