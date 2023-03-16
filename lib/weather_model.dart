import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/weather_result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherModel extends ChangeNotifier {

  final yumemiWeather = YumemiWeather();

  WeatherResult? weatherResult;

  void reloadWeatherWithError() {
    try {
      final weather = yumemiWeather.fetchThrowsWeather('area');
      weatherResult = WeatherResult(successed: true, weather: weather);
    } on YumemiWeatherError catch (e){
      weatherResult = WeatherResult(successed: false, error: e);
    }
    notifyListeners();
  }
  
  SvgPicture? getWetherImage() {
    switch (weatherResult?.weather) {
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
