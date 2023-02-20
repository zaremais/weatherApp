import 'package:flutter/material.dart';

import '../features/weather/presentation/screens/weather_search_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherSearchScreen(),
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff3fa2fa)),
    );
  }
}
