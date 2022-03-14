

/// 双击返回
DateTime? _lastPressedAt; //上次点击时间
bool isDoubleClick(){
  if (_lastPressedAt == null ||
      DateTime.now().difference(_lastPressedAt!) >
          Duration(seconds: 1)) {
    //两次点击间隔超过1秒则重新计时
    _lastPressedAt = DateTime.now();
    return false;
  }
  return true;
}