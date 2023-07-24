import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class ProviderPage extends BasePageWidget {
  static final String keys = "providerView";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.provider;

  @override
  String? get getDes => providerDes;


  @override
  String? get getCode => providerCode;

}

