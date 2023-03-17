import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherResult {
  /// コンストラクタ
  WeatherResult({
    required this.successed,
    this.weather,
    this.error,
  });

  bool successed;
  Weather? weather;
  YumemiWeatherError? error;
}

class Weather {
  Weather({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory Weather.fromJson(dynamic json) {
    return Weather(
      weatherCondition: json['weather_condition'] as String,
      maxTemperature: json['max_temperature'] as int,
      minTemperature: json['min_temperature'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }
  final String weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;
}
