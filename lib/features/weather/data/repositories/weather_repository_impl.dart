import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../internal/helpers/api_reguester.dart';
import '../../../../internal/helpers/error_helpers.dart';
import '../../domain/repositories/weather_repository.dart';
import '../models/weather_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  APIRequester apiRequester = APIRequester();

  @override
  Future<WeatherModel> getWeather({required String city}) async {
    try {
      Response response = await apiRequester.toGet(
          //  'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey',
          "/data/2.5/weather?q=$city&appid=20de277bfd24db7e71ec9d03f8d7e2b2",
          queryParameters: {});
      log(response.data.toString());

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
