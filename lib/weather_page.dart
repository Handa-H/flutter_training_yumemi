import 'package:flutter/material.dart';
import 'package:flutter_training/weather_model.dart';
import 'package:provider/provider.dart';

/// 天気ページ
class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.title});
  final String title;

  void showAlert(BuildContext context, String message) {
    WidgetsBinding.instance.endOfFrame.then((value) {
      showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('エラーが発生'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Consumer<WeatherModel>(
            builder: (context, model, child) {
              if (model.weatherResult?.successed == false) {
                showAlert(context, model.weatherResult!.error!.toString());
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: model.weatherResult?.successed == true
                        ? model.getWetherImage()
                        : const Placeholder(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            model.getMinTemperture(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.blue,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            model.getMaxTemperture(),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Colors.red,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('close'),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              model.reloadWeatherWithError();
                            },
                            child: const Text('reload'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
