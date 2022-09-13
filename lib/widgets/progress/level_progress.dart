import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const int _kIndeterminateLinearDuration = 1800;
const List<String> defaultLevel = ["1","2","3","4","5"];
const List<String> defaultLevelValue = ["1000","2000","3000","4000","5000"];
/// 等级进度条
class LevelProgressIndicator extends ProgressIndicator {
  final double? minHeight;
  final List<String>? level;
  final List<String>? levelNum;
  const LevelProgressIndicator({
    Key? key,
    double? value,
    Color? backgroundColor,
    Color? color,
    Animation<Color>? valueColor,
    this.minHeight,
    this.level,
    this.levelNum,
  })  : assert(minHeight == null || minHeight > 0),
        super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          color: color,
          valueColor: valueColor,
        );

  @override
  Color? get backgroundColor => super.backgroundColor;

  @override
  State<LevelProgressIndicator> createState() =>
      _LevelProgressIndicatorState();
}

class _LevelProgressIndicatorState extends State<LevelProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: _kIndeterminateLinearDuration),
      vsync: this,
    );
    if (widget.value == null) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(LevelProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildIndicator(BuildContext context, double animationValue,
      TextDirection textDirection) {
    final ProgressIndicatorThemeData indicatorTheme =
        ProgressIndicatorTheme.of(context);
    final Color trackColor = widget.backgroundColor ??
        indicatorTheme.linearTrackColor ??
        Theme.of(context).colorScheme.background;
    final double minHeight =
        widget.minHeight ?? indicatorTheme.linearMinHeight ?? 4.0;

    return Container(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
      ),
      child: CustomPaint(
        painter: _UserLevelIndicatorPainter(
          backgroundColor: trackColor,
          valueColor: widget.color??Theme.of(context).primaryColor,
          value: widget.value,
          // may be null
          animationValue: animationValue,
          // ignored if widget.value is not null
          textDirection: textDirection,
          level: widget.level??defaultLevel,
          levelNum: widget.levelNum??defaultLevelValue,
          minHeight: minHeight,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection = Directionality.of(context);

    if (widget.value != null) {
      return _buildIndicator(context, _controller.value, textDirection);
    }

    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return _buildIndicator(context, _controller.value, textDirection);
      },
    );
  }
}

class _UserLevelIndicatorPainter extends CustomPainter {
  _UserLevelIndicatorPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
    required this.animationValue,
    required this.level,
    required this.levelNum,
    required this.textDirection,
    required this.minHeight,
  });

  final Color backgroundColor;
  final Color valueColor;
  final double animationValue;
  final double minHeight;
  final double? value;
  final TextDirection textDirection;
  final List level;
  final List levelNum;

  static const Curve line1Head = Interval(
    0.0,
    750.0 / _kIndeterminateLinearDuration,
    curve: Cubic(0.2, 0.0, 0.8, 1.0),
  );
  static const Curve line1Tail = Interval(
    333.0 / _kIndeterminateLinearDuration,
    (333.0 + 750.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.4, 0.0, 1.0, 1.0),
  );
  static const Curve line2Head = Interval(
    1000.0 / _kIndeterminateLinearDuration,
    (1000.0 + 567.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.0, 0.0, 0.65, 1.0),
  );
  static const Curve line2Tail = Interval(
    1267.0 / _kIndeterminateLinearDuration,
    (1267.0 + 533.0) / _kIndeterminateLinearDuration,
    curve: Cubic(0.10, 0.0, 0.45, 1.0),
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) {
        return;
      }
      late double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }
      canvas.drawRRect(
          RRect.fromRectXY(
              Offset(left, 0.0) & Size(width, size.height), 10, 10),
          paint);
    }

    ///值
    if (value != null) {
      drawBar(0.0, value!.clamp(0.0, 1.0) * size.width);
    } else {
      final double x1 = size.width * line1Tail.transform(animationValue);
      final double width1 =
          size.width * line1Head.transform(animationValue) - x1;

      final double x2 = size.width * line2Tail.transform(animationValue);
      final double width2 =
          size.width * line2Head.transform(animationValue) - x2;

      drawBar(x1, width1);
      drawBar(x2, width2);
    }
    ///画点
    paint.color = const Color(0xffCAA675);

    final Paint paint2 = Paint()
      ..color = const Color(0xffF4DCA4)
      ..style = PaintingStyle.fill;
    for (int i = 0; i < level.length; i++) {
      //当前进度
      double curValue = (value??0).clamp(0.0, 1.0) * size.width;
      double circleValue = (size.width / (level.length-1)) * i;
      if (circleValue - (5.w+minHeight) < curValue && curValue < circleValue + (5.w+minHeight)) {
        canvas.drawCircle(Offset(circleValue, (0+minHeight)/2), 5.w+minHeight, paint2);
        paint2.color = const Color(0x33F4DCA4);
        canvas.drawCircle(Offset(circleValue, (0+minHeight)/2), 10.w+minHeight, paint2);
      } else {
        canvas.drawCircle(Offset(circleValue, (0+minHeight)/2), 5.w+minHeight, paint);
      }
      //下面文字
      ParagraphBuilder _pb = ParagraphBuilder(
          ParagraphStyle(fontWeight: FontWeight.normal, fontSize: 12.w))
        ..pushStyle(ui.TextStyle(color: Colors.black))
        ..addText(level[i]);
      ParagraphConstraints pc = ParagraphConstraints(width: size.width);
      Paragraph paragraph = _pb.build()..layout(pc);
      double offsetx = circleValue -
          textSize(level[i], TextStyle(fontSize: 12.w)).width / 2;
      canvas.drawParagraph(paragraph, Offset(offsetx, 15.h+minHeight*2));
      //上面文字
      var paragraphStyle =
          ParagraphStyle(fontWeight: FontWeight.normal, fontSize: 12.w);
      ParagraphBuilder _pb1 = ParagraphBuilder(paragraphStyle)
        ..pushStyle(ui.TextStyle(color: Colors.black))
        ..addText(levelNum[i]);
      Paragraph paragraph1 = _pb1.build()..layout(pc);
      double offsetx1 = circleValue -
          textSize(levelNum[i], TextStyle(fontSize: 12.w)).width / 2;
      canvas.drawParagraph(paragraph1, Offset(offsetx1, -30.h-minHeight));
    }
  }

  Size textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  bool shouldRepaint(_UserLevelIndicatorPainter oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        oldPainter.value != value ||
        oldPainter.animationValue != animationValue ||
        oldPainter.textDirection != textDirection;
  }
}
