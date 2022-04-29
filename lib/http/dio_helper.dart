import 'package:dio/dio.dart';
import 'MyDioInterceptor.dart';
// ignore: slash_for_doc_comments
/**
 * DioHelper.getInstance().http.get("/xxx/xx")
 */
class DioHelper {
  static const int TIMEOUT_CONNECT = 5000; //连接超时时间
  static const int TIMEOUT_SEND = 5000; //发送超时时间
  static const int TIMEOUT_RECEIVE = 5000; //接收超时时间
  static DioHelper? _instance;
  String? token;
  late Dio dio;

  static DioHelper getInstance() {
    if (_instance == null) _instance = new DioHelper();
    return _instance!;
  }

  Dio get http {
    return dio;
  }

  DioHelper() {
    dio = new Dio();
    dio.options
          ..baseUrl = 'https://xxxx.cn'
          ..connectTimeout = TIMEOUT_CONNECT
          ..sendTimeout = TIMEOUT_SEND
          ..receiveTimeout = TIMEOUT_RECEIVE
          ..validateStatus = (int? status) {
            return status != null && status > 0;
          }
          //请求数据类型 默认序列化为jsonContnentType | Headers.formUrlEncodedContentType
          /* ..contentType = Headers.formUrlEncodedContentType  */
          //接收数据类型
          ..responseType = ResponseType.json
        /* ..headers = {
       HttpHeaders.userAgentHeader: 'dio',
       'common-header': 'xx',
    }*/
        ;

    /**
     * 添加拦截器
     */
    dio.interceptors
      ..add(MyDioInterceptor())//LogInterceptor(requestBody: true,responseBody: true)
      // ..add(CookieManager(CookieJar()))//CookieManager(PersistCookieJar()) 持久化tCookie 退出时需要手动删除
    ;

    /*
    *  HttpClientAdapter是 Dio 和 HttpClient之间的桥梁
    *  2.0抽象出adapter主要是方便切换、定制底层网络库。Dio实现了一套标准的、强大API，而HttpClient则是真正发起Http请求的对象。
    *  我们通过HttpClientAdapter将Dio和HttpClient解耦，这样一来便可以自由定制Http请求的底层实现，
    *  比如，在Flutter中我们可以通过自定义HttpClientAdapter将Http请求转发到Native中，然后再由Native统一发起请求
    */
    // dio.httpClientAdapter = HooKHttpClientAdapter();

    //转换器:转换器Transformer 用于对请求数据和响应数据进行编解码处理。Dio实现了一个默认转换器DefaultTransformer作为默认的 Transformer. 如果你想对请求/响应数据进行自定义编解码处理，可以提供自定义转换器
    // dio.transformer = DefaultTransformer();

    /*设置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        return 'PROXY localhost:8888';
      };
    };*/

    /*添加证书文件
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate  = (client) {
      SecurityContext sc = SecurityContext();
      sc.setTrustedCertificates(file);//file is the path of certificate
      HttpClient httpClient = HttpClient(context: sc);
      return httpClient;
    };*/
  }

  var _token = CancelToken();
  ///请求
  void request(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? method
  }) {
    var options = Options(method: method??'GET');
    dio.request(path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: _token,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
  }

  ///取消请求
  void cancelRequest() {
    _token.cancel('取消请求');
  }

  ///取消请求
  bool get isCancelRequest{
    return _token.isCancelled;
  }

  ///测试用例
  // void main() async {
  //   try {
  //     //get
  //     Response response = await http.get('http://www.google.com');
  //     response = await http.get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
  //     //post
  //     response = await dio.post('/test', data: {'id': 12, 'name': 'wendu'});
  //     //表单提交
  //     var formData = FormData.fromMap({
  //       'name': 'wendux',
  //       'age': 25,
  //     });
  //     response = await dio.post('/info', data: formData);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
