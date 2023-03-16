import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherResult {
  /// コンストラクタ
  WeatherResult({
    required this.successed,
    this.weather,
    this.error,
  });

  bool successed;
  String? weather;
  YumemiWeatherError? error;

}
