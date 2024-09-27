import 'package:dartz/dartz.dart';
import 'package:weather_app/core/errors/failure.dart';
import 'package:weather_app/features/home/data/models/weather_model/weather_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherModel>> getWeatherData({required String city});
}