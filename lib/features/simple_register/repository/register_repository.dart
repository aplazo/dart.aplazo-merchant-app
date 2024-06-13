import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class RegisterRepository {
  Future<String> registerBasicData(String bussinessName, String industry,
      String rfc, String contactPhone, String email, String clabeAccount);
}

class RegisterRepositoryImpl extends RegisterRepository {
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
  Future<String> registerBasicData(
      String bussinessName,
      String industry,
      String rfc,
      String contactPhone,
      String email,
      String clabeAccount) async {
    try {
      // Primera petición
      Response response1 = await client.post(
        'https://nwu6p3nz8l.execute-api.us-west-1.amazonaws.com/merchant_creation',
        data: {
          'commerce_name': bussinessName,
          'cat_integration_type': "POSUI",
          'customer_fee': 0.5
        },
      ).then((value) {
        return value;
      });

      // Segunda petición basada en la respuesta de la primera
      // ignore: unused_local_variable
      Response response2 = await client.post(
        'https://merchant.aplazo.net/merchant/create-branch',
        data: {
          "branches": ["bussinessName"]
        },
        options: Options(
          headers: {
            "merchant_id": response1.data['merchant_id'],
            "api_token": response1.data['api_token']
          },
        ),
      );

      Response response3 = await client.post(
        'https://shield-back.aplazo.net/api/v1/merchant/micro/' +
            response1.data['merchant_id'] +
            '/password',
        data: {"password": "Aplazo@123", "login": email},
      );

      // Manejar la respuesta de la segunda petición
      return response1.data["merchant_id"];
    } on DioException {
      rethrow;
    }
  }
}
