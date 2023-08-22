import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/custom_color.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBarWidget extends StatefulWidget {
  final double height;
  final Color bgColor;
  final Color tipColor;
  final Color color;
  final double fontSize;
  final double cursorHeight;
  final String? tipContent;
  final TextInputType textInputType ;
  final EdgeInsetsGeometry leftIconPadding ;
  final EdgeInsetsGeometry rightIconPadding ;
  final Widget? leftIcon;
  final Widget? rightIcon;

  CustomSearchBarWidget({
    Key? key,
    this.height = 60,
    this.bgColor = Colors.grey,
    this.tipColor =Colors.white,
    this.color  = color_2A2F3C,
    this.fontSize = 16,
    this.cursorHeight = 2,
    this.tipContent,
    this.textInputType = TextInputType.text,
    this.leftIconPadding = const EdgeInsets.only(left: 10),
    this.rightIconPadding = const EdgeInsets.only(left: 10),
    this.leftIcon,
    this.rightIcon,
  }) : super(key: key);

  @override
  State<CustomSearchBarWidget> createState() => _CustomSearchBarWidgetState();
}

class _CustomSearchBarWidgetState extends State<CustomSearchBarWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();



  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_focusListener);
  }

  // 焦点监听
  _focusListener() {
    var hasFocus = _focusNode.hasFocus;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_focusListener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        child: CupertinoTextField(
          decoration: BoxDecoration(
            //圆角
            borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
            color: widget.bgColor, //背景色
          ),
          //输入类型
          keyboardType: widget.textInputType,
          cursorHeight: widget.cursorHeight,
          //提示
          placeholder: widget.tipContent??S.current.inputSearchTip,
          //提示样式
          placeholderStyle: TextStyle(
            fontSize: widget.fontSize,
            color: widget.tipColor,
          ),
          //输入样式
          style: TextStyle(fontSize: widget.fontSize, color: widget.color),
          // 文本前面组件
          prefix: Padding(
            padding: widget.leftIconPadding,
            child: widget.leftIcon??Image.asset(
              Assets.imagesCommonSearchIcon,
              color: Colors.white,
              width: 20,
              height: 20,
            ),
          ),
          // 文本前面组件显示样式
          prefixMode: OverlayVisibilityMode.always,
          // 文本后面组件
          suffix: IconButton(
            padding: widget.rightIconPadding,
            onPressed: () => _clickRightIcon(),
            icon: widget.rightIcon??Icon(Icons.cancel_rounded, color: Colors.white, size: 40.r),
          ),
          suffixMode: OverlayVisibilityMode.editing,
          textInputAction: TextInputAction.search,
          focusNode: _focusNode,
          controller: _controller,
          onSubmitted: (text) => _onSubmitted(text),
          onChanged: (text) => _onChanged(text),
          onTapOutside: (pointerDownEvent) => _onTapOutside(pointerDownEvent),
        ));
  }

  // 点击右边按钮
  _clickRightIcon() {
    println.e('_clickRightIcon');
    _controller.clear();
  }

  // 点击键盘搜索建
  _onSubmitted(String text) {
    println.e('_onSubmitted $text');
  }

  // 文本变化监听
  _onChanged(String text) {}

  // 点击外部取消焦点 隐藏键盘
  _onTapOutside(PointerDownEvent pointerDownEvent) {
    _focusNode.unfocus();
  }
}
