import 'package:dio/dio.dart';

/// 网络拦截器
class MyDioInterceptor extends Interceptor {
  MyDioInterceptor({
    this.logPrint = print,
  });

  void Function(Object object) logPrint;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint('****** Request ******');
    _printKV('uri', options.uri);
    _printKV('method', options.method);
    _printKV('queryParameters', options.queryParameters);
    _printKV('responseType', options.responseType.toString());
    _printKV('followRedirects', options.followRedirects);
    _printKV('connectTimeout', options.connectTimeout);
    _printKV('sendTimeout', options.sendTimeout);
    _printKV('receiveTimeout', options.receiveTimeout);
    _printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError);
    _printKV('extra', options.extra);
    logPrint('headers:');
    options.headers.forEach((key, v) => _printKV(' $key', v));
    logPrint('data:');
    _printAll(options.data);
    logPrint('');
    handler.next(options);
    logPrint('****** End ******');
    // 请求token
    // if (token == null) {
    //   print('no token，request token firstly...');
    //   dio.get('/token').then((d) {
    //     options.headers['token'] = token = d.data['data']['token'];
    //     print('request token succeed, value: ' + d.data['data']['token']);
    //     print(
    //         'continue to perform request：path:${options.path}，baseURL:${options.path}');
    //     handler.next(options);
    //   }).catchError((error, stackTrace) {
    //     handler.reject(error, true);
    //   });
    // } else {
    //   options.headers['token'] = token;
    //   return handler.next(options);
    // }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    logPrint('****** Response ******');
    _printResponse(response);
    handler.next(response);
    logPrint('****** End ******');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('****** DioError ******:');
    logPrint('uri: ${err.requestOptions.uri}');
    logPrint('$err');
    if (err.response != null) {
      _printResponse(err.response!);
    }
    logPrint('');
    handler.next(err);
    logPrint('****** End ******');
  }

  void _printResponse(Response response) {
    _printKV('uri', response.requestOptions.uri);
    _printKV('statusCode', response.statusCode);
    if (response.isRedirect == true) {
      _printKV('redirect', response.realUri);
    }
    logPrint('headers:');
    response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    logPrint('Response Text:');
    _printAll(response.toString());
    logPrint('');
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}
