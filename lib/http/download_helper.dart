import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_blcs/http/dio_helper.dart';


///下载文件 适用于小文件
Future download(String url, savePath,{ProgressCallback? onReceiveProgress}) async {
  var cancelToken = CancelToken();
  try {
    await DioHelper.getInstance().http.download(
      url,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      options: Options(
          receiveTimeout: 0
      ),
    );
  } catch (e) {
    print(e);
  }
}
/// 分段下载 适用于大文件
Future downloadWithChunks(
  url,
  savePath, {
  ProgressCallback? onReceiveProgress,
}) async {
  const firstChunkSize = 102;
  const maxChunk = 3;

  var total = 0;
  var progress = <int>[];
  var http = DioHelper.getInstance().http;
  void Function(int, int) createCallback(no) {
    return (int received, int _) {
      progress[no] = received;
      if (onReceiveProgress != null && total != 0) {
        onReceiveProgress(progress.reduce((a, b) => a + b), total);
      }
    };
  }

  Future<Response> downloadChunk(url, start, end, no) async {
    progress.add(0);
    --end;
    return http.download(
      url,
      savePath + 'temp$no',
      onReceiveProgress: createCallback(no),
      options: Options(
        headers: {'range': 'bytes=$start-$end'},
        receiveTimeout: 0
      ),
    );
  }

  Future mergeTempFiles(chunk) async {
    var f = File(savePath + 'temp0');
    var ioSink = f.openWrite(mode: FileMode.writeOnlyAppend);
    for (var i = 1; i < chunk; ++i) {
      var _f = File(savePath + 'temp$i');
      await ioSink.addStream(_f.openRead());
      await _f.delete();
    }
    await ioSink.close();
    await f.rename(savePath);
  }

  var response = await downloadChunk(url, 0, firstChunkSize, 0);
  if (response.statusCode == 206) {
    total = int.parse(response.headers
        .value(HttpHeaders.contentRangeHeader)!
        .split('/')
        .last);
    var reserved =
        total - int.parse(response.headers.value(Headers.contentLengthHeader)!);
    var chunk = (reserved / firstChunkSize).ceil() + 1;
    if (chunk > 1) {
      var chunkSize = firstChunkSize;
      if (chunk > maxChunk + 1) {
        chunk = maxChunk + 1;
        chunkSize = (reserved / maxChunk).ceil();
      }
      var futures = <Future>[];
      for (var i = 0; i < maxChunk; ++i) {
        var start = firstChunkSize + i * chunkSize;
        futures.add(downloadChunk(url, start, start + chunkSize, i + 1));
      }
      await Future.wait(futures);
    }
    await mergeTempFiles(chunk);
  }
}

///测试用例
// void main() async {
//  var url = "https://www.baidu.com/img/bdlogo.gif";
//   var savePath = './static/aaa.gif';
//   await download(url, savePath, onReceiveProgress: (received, total) {
//     if (total != -1) {
//       print('${(received / total * 100).floor()}%');
//     }
//   });
// }
