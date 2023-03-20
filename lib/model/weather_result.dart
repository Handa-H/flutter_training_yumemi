import 'package:flutter_training/model/weather.dart';
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
