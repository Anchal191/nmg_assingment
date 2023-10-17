import 'package:dio/dio.dart';

class DioClient {

  Dio dio = Dio();

  DioClient() {
    dio
      ..options.connectTimeout = Duration(milliseconds: 30000)
      ..options.receiveTimeout = Duration(milliseconds: 30000)
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
  }

  Future<Response> get(String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    print('Url>>>'+uri);
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      print('Response>>>'+response.toString());
      return response;
    } catch (ex) {
      rethrow;
    }
  }


}