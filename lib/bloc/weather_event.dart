part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadPune extends WeatherEvent {}

class LoadNasik extends WeatherEvent {}

class LoadMumbai extends WeatherEvent {}

class LoadNagpur extends WeatherEvent {}

class LoadCurrentLocation extends WeatherEvent {
  final String latitude;
  final String longitude;

  LoadCurrentLocation({this.latitude, this.longitude});
}
