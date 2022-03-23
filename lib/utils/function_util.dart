

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

/// print2('你要打印信息',StackTrace.current);
void print2(String log,StackTrace trace) {
  var traceString = trace.toString().split("\n")[0];
  var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_]+.dart'));
  var fileInfo = traceString.substring(indexOfFileName);
  var listOfInfos = fileInfo.split(":");
  var fileName = listOfInfos[0];
  var lineNumber = int.parse(listOfInfos[1]);
  var columnStr = listOfInfos[2];
  columnStr = columnStr.replaceFirst(")", "");
  var columnNumber = int.parse(columnStr);
  print("文件: $fileName, 行: $lineNumber, columnNumber: $columnNumber, log:\n $log");
}
