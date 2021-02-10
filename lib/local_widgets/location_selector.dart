import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LocationSelector extends StatefulWidget {
  @override
  _LocationSelectorState createState() => _LocationSelectorState();
}

class _LocationSelectorState extends State<LocationSelector> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Container(
              width: 200,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: DropdownButton<String>(
                dropdownColor: Colors.blue[300],
                value: dropdownValue,
                hint: Text(
                  "--select--",
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                icon: Icon(
                  Icons.cloud,
                  color: Colors.white,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.white, fontSize: 27),
                underline: Container(
                  height: 2,
                  color: Colors.white,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: "Pune",
                    child: Text(
                      "Pune",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context).add(LoadPune());
                    },
                  ),
                  DropdownMenuItem<String>(
                    value: "Mumbai",
                    child: Text(
                      "Mumbai",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context).add(LoadMumbai());
                    },
                  ),
                  DropdownMenuItem<String>(
                    value: "Nashik",
                    child: Text(
                      "Nashik",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context).add(LoadNasik());
                    },
                  ),
                  DropdownMenuItem<String>(
                    value: "Nagpur",
                    child: Text(
                      "Nagpur",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      BlocProvider.of<WeatherBloc>(context).add(LoadNagpur());
                    },
                  ),
                ],
              ),
            ),
            (state is WeatherInitial || state is WeatherLoading)
                ? Container()
                : _showWeatherCondition(
                    state.responseData['weather'][0]['main'].toString()),
            SizedBox(
              height: 30,
              child: Text(
                (state is WeatherInitial || state is WeatherLoading)
                    ? ""
                    : state.responseData['weather'][0]['description']
                        .toString(),
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _showWeatherCondition(String weatherCondition) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherCondition,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 10,
              ),
              _weatherIcon(weatherCondition),
            ],
          ),
        ),
      ],
    );
  }

  _weatherIcon(String weatherCondition) {
    if (weatherCondition == 'Clouds')
      return Icon(
        FlutterIcons.cloud_sun_faw5s,
        color: Colors.blue[200],
        size: 30,
      );
    else if (weatherCondition == 'Haze')
      return Icon(
        FlutterIcons.wi_day_haze_wea,
        color: Colors.yellowAccent,
        size: 30,
      );
    else if (weatherCondition == 'Clear')
      return Icon(
        FlutterIcons.md_sunny_ion,
        color: Colors.yellowAccent,
        size: 30,
      );
    else
      return Icon(
        FlutterIcons.md_rainy_ion,
        color: Colors.grey[400],
        size: 30,
      );
  }
}