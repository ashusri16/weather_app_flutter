part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherLoaded extends WeatherState {
  final responseData;
  final isUsingLiveLocation;
  const WeatherLoaded(this.responseData, this.isUsingLiveLocation);
}

class WeatherLoadError extends WeatherState {
  final String errorMessage;
  WeatherLoadError(this.errorMessage);
}
