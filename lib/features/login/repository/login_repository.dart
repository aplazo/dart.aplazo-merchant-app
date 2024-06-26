import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class LoginRepository {
  Future<String> login(String username, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  final Dio client = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  @override
  Future<String> login(String username, String password) async {
    try {
      return await client.post('https://api.aplazo.net/login', data: {
        'login': username,
        'password': password
      }).then((value) => value.data['Authorization']);
    } on DioException {
      rethrow;
    }
  }
}
