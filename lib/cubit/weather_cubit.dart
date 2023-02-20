import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_42/helpers/api_reguester.dart';
import 'package:flutter_application_42/helpers/error_helpers.dart';
import 'package:flutter_application_42/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  APIRequester apiRequester = APIRequester();

  Future<void> getWeather({required String city}) async {
    emit(WeatherLoading());
    try {
      Response response = await apiRequester.toGet(
          //  'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$_apiKey',
          "/data/2.5/weather?q=$city&appid=20de277bfd24db7e71ec9d03f8d7e2b2",
          queryParameters: {});
      log(response.data.toString());
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      emit(WeatherFetched(weatherModel));
    } catch (error) {
      log(error.toString());
      if (error is ErrorsEnum) {
        emit(WeatherError(error));
      } else {
        emit(WeatherError(ErrorsEnum.invalidError));
      }
    }
  }
}

// 123
