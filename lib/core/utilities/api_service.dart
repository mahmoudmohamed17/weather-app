import 'package:dio/dio.dart';

class ApiService {
  final _dio = Dio();
  final String _apiKey = '0966a3c7e2504ba2972174811242207';
  final String _baseUrl = 'https://api.weatherapi.com/v1/forecast.json';
  Future<Map<String, dynamic>> getWeathetData({required String city}) async {
    var response = await _dio
        .get('$_baseUrl?key=$_apiKey&q=$city');
    return response.data;
  }
}
