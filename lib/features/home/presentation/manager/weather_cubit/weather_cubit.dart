import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/data/models/weather_model/weather_model.dart';
import 'package:weather_app/features/home/data/repos/home_repo.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this._homeRepo) : super(WeatherInitial());
  final HomeRepo _homeRepo;
  WeatherModel? weatherModel;
  Future<void> getWeatherData({required String city}) async {
    emit(WeatherLoading());
    var result = await _homeRepo.getWeatherData(city: city);
    result.fold((failure) {
      emit(WeatherFailure(errorMsg: failure.errorMsg));
    }, (weatherModel) {
      this.weatherModel = weatherModel;
      emit(WeatherSuccess(weatherModel: weatherModel));
    });
  }

  MaterialColor getThemeColor() {
    String? weatherCondition = weatherModel!.current?.condition?.text;
    if (weatherCondition == 'Sunny') {
      return Colors.orange;
    } else if (weatherCondition == 'Blizzard' ||
        weatherCondition == 'Patchy snow possible' ||
        weatherCondition == 'Patchy sleet possible' ||
        weatherCondition == 'Patchy freezing drizzle possible' ||
        weatherCondition == 'Blowing snow' ||
        weatherCondition == 'Clear') {
      return Colors.blue;
    } else if (weatherCondition == 'Freezing fog' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Heavy Cloud' ||
        weatherCondition == 'Mist' ||
        weatherCondition == 'Fog' ||
        weatherCondition == 'Partly cloudy' ||
        weatherCondition == 'Overcast') {
      return Colors.blueGrey;
    } else if (weatherCondition == 'Patchy rain possible' ||
        weatherCondition == 'Heavy Rain' ||
        weatherCondition == 'Showers' ||
        weatherCondition == 'Light rain' || weatherCondition == 'Light rain shower') {
      return Colors.blue;
    } else if (weatherCondition == 'Thundery outbreaks possible' ||
        weatherCondition == 'Moderate or heavy snow with thunder' ||
        weatherCondition == 'Patchy light snow with thunder' ||
        weatherCondition == 'Moderate or heavy rain with thunder' ||
        weatherCondition == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }

}
