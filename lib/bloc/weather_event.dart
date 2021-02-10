part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadPune extends WeatherEvent {}

class LoadNasik extends WeatherEvent {}

class LoadMumbai extends WeatherEvent {}

class LoadNagpur extends WeatherEvent {}
