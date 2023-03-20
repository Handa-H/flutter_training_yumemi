import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/model/weather.dart';
import 'package:flutter_training/model/weather_request.dart';
import 'package:flutter_training/model/weather_result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherModel extends ChangeNotifier {
  final yumemiWeather = YumemiWeather();

  WeatherResult? weatherResult;

  void reloadWeatherWithError() {
    try {
      final requestParam = WeatherRequest(area: 'area', date: DateTime.now());
      final jsonWeather = yumemiWeather.fetchWeather(
        jsonEncode(requestParam.toJson()),
      );
      final weather =
          Weather.fromJson(jsonDecode(jsonWeather) as Map<String, dynamic>);
      weatherResult = WeatherResult(successed: true, weather: weather);
    } on YumemiWeatherError catch (e) {
      weatherResult = WeatherResult(successed: false, error: e);
    }
    notifyListeners();
  }

  String getMaxTemperture() {
    if (weatherResult?.weather == null) {
      return '**℃';
    } else {
      return '${weatherResult!.weather!.maxTemperature}℃';
    }
  }

  String getMinTemperture() {
    if (weatherResult?.weather == null) {
      return '**℃';
    } else {
      return '${weatherResult!.weather!.minTemperature}℃';
    }
  }

  SvgPicture? getWetherImage() {
    switch (weatherResult?.weather?.weatherCondition) {
      case 'rainy':
        return SvgPicture.asset(
          'assets/images/rainy.svg',
        );
      case 'sunny':
        return SvgPicture.asset(
          'assets/images/sunny.svg',
        );
      case 'cloudy':
        return SvgPicture.asset(
          'assets/images/cloudy.svg',
        );
    }
    return null;
  }
}
