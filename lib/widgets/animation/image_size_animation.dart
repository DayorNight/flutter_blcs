import 'package:flutter/material.dart';

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({required Listenable listenable})
      : super(listenable: listenable);

  @override
  Widget build(BuildContext context) {
    var animation = listenable as Animation<double>;
    return Icon(
      Icons.favorite_rounded,
      color: Colors.red,
      size: animation.value,
    );
  }
}
