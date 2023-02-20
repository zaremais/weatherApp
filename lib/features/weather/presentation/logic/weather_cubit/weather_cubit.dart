import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_42/features/weather/domain/use_case/weather_use_case.dart';
import 'package:flutter_application_42/internal/helpers/api_reguester.dart';
import 'package:flutter_application_42/internal/helpers/error_helpers.dart';
import 'package:flutter_application_42/features/weather/data/models/weather_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  WeatherUseCase useCase = WeatherUseCase();

  Future<void> getWeather({required String city}) async {
    
    await useCase
        .getWeather(city: city)
        .then((weatherModel) => emit(WeatherFetched(weatherModel)))
        .onError((error, stackTrace) {
      if (error is ErrorsEnum) {
        emit(WeatherError(error));
      } else {
        emit(WeatherError(ErrorsEnum.invalidError));
      }
    });
  }
}
