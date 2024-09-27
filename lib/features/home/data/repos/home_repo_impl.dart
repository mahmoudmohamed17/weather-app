import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/core/utilities/api_service.dart';
import 'package:weather_app/features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final _apiService = ApiService();
  @override
  Future<Either<Failure, WeatherModel>> getWeatherData(
      {required String city}) async {
    try {
      var data = await _apiService.getWeathetData(city: city);
      WeatherModel weatherModel = WeatherModel.fromJson(data);
      return right(weatherModel);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(errorMsg: e.toString()));
    }
  }
}
