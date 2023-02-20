import 'package:flutter_application_42/features/weather/data/repositories/weather_repository_impl.dart';

import '../../data/models/weather_model.dart';

class WeatherUseCase {
  WeatherRepositoryImpl weatherRepository = WeatherRepositoryImpl();

  Future<WeatherModel> getWeather({required String city}) =>
      weatherRepository.getWeather(city: city);
}
