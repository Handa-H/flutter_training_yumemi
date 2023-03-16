import 'package:flutter/material.dart';
import 'package:flutter_training/end_of_frame_mixin.dart';
import 'package:flutter_training/weather_model.dart';
import 'package:flutter_training/weather_page.dart';
import 'package:provider/provider.dart';

/// 最初に表示される画面
class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with endOfFrameMixin  {
  @override
  void doAfterFrame() {
    _waitAndPass();
  }

  Future<void> _waitAndPass() async {
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
        create: (context) => WeatherModel(),
        child: const WeatherPage(title: 'Flutter Demo Home Page'),
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
