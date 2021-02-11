part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  final responseData;
  final bool isUsingLiveLocation;
  WeatherState(this.responseData, this.isUsingLiveLocation);
}

class WeatherInitial extends WeatherState {
  WeatherInitial(responseData, isUsingLiveLocation)
      : super(responseData, isUsingLiveLocation);
}

class WeatherLoading extends WeatherState {
  WeatherLoading(responseData, isUsingLiveLocation)
      : super(responseData, isUsingLiveLocation);
}

class WeatherLoaded extends WeatherState {
  WeatherLoaded(responseData, isUsingLiveLocation)
      : super(responseData, isUsingLiveLocation);
}

class WeatherLoadError extends WeatherState {
  WeatherLoadError(responseData, isUsingLiveLocation)
      : super(responseData, isUsingLiveLocation);
}
