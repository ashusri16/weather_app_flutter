part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final responseData;

  WeatherState(this.responseData);
}

class WeatherInitial extends WeatherState {
  WeatherInitial(responseData) : super(responseData);
}

class WeatherLoading extends WeatherState {
  WeatherLoading(responseData) : super(responseData);
}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(responseData) : super(responseData);
}

class WeatherLoadError extends WeatherState {
  WeatherLoadError(responseData) : super(responseData);
}
