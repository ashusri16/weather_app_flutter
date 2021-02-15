import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    var url;
    var isUsingLiveLocation;
    yield WeatherLoading();
    var locationId;
    if (event is LoadPune) {
      locationId = "1259229";
    } else if (event is LoadNasik) {
      locationId = "1261731";
    } else if (event is LoadMumbai) {
      locationId = "1275339";
    } else if (event is LoadNagpur) {
      locationId = "1262180";
    }
    if (event is LoadCurrentLocation) {
      url =
          "https://api.openweathermap.org/data/2.5/weather?lat=${event.latitude}&lon=${event.longitude}&appid=fa5b22b38f1f2433d0b7a6efa01f365e";
      isUsingLiveLocation = true;
    } else {
      url =
          "https://api.openweathermap.org/data/2.5/weather?id=$locationId&appid=fa5b22b38f1f2433d0b7a6efa01f365e";
      isUsingLiveLocation = false;
    }
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      yield WeatherLoaded(jsonResponse, isUsingLiveLocation);
    } else {
      yield WeatherLoadError(
          "Loading failed with error code: ${response.statusCode}");
    }
  }
}
