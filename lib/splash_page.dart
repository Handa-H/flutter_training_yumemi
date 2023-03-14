import 'package:flutter/material.dart';
import 'package:flutter_training/weather_page.dart';
import 'package:flutter_training/wether_model.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.endOfFrame.then((value) {
      _waitAndPass();
    });
    super.initState();
  }

  Future<void> _waitAndPass() async {
    await Future.delayed(const Duration(seconds: 2));
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
