import 'dart:ffi';

import 'package:flutter_application_42/features/weather/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather({required String city});
  
}
