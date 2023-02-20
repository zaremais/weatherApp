part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherFetched extends WeatherState {
  final WeatherModel weatherModel;

  WeatherFetched(this.weatherModel);
}

class WeatherLoading extends WeatherState {
  WeatherLoading();
}

class WeatherError extends WeatherState {
  final ErrorsEnum error;

  WeatherError(this.error);
}
