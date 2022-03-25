
import 'package:logger/logger.dart';

///logger.v("Verbose log");
/// logger.d("Debug log");
/// logger.i("Info log");
/// logger.w("Warning log");
/// logger.e("Error log");
/// logger.wtf("What a terrible failure log");
/// 设置只显示指定级别 Logger.level = Level.warning;
var println = Logger(
    filter: null, ///MyFilter
    output: null, ///ConsoleOutput
    printer: PrettyPrinter( ///MyPrinter
        methodCount: 1,
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: true // 显示时间
    ),
  );

///filter 过滤
class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
///printer 输出
class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}
///output
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}