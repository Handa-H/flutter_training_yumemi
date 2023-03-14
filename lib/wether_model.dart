import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherModel extends ChangeNotifier {

  final yumemiWeather = YumemiWeather();

  String? _weatherString;

  SvgPicture? get weatherImage {
    switch (_weatherString) {
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

  void reloadWeather() {
    _weatherString = yumemiWeather.fetchSimpleWeather();
    notifyListeners();
  }
}
