import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/local_widgets/custom_card.dart';

import 'bloc/weather_bloc.dart';
import 'local_widgets/location_selector.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          BlocProvider.of<WeatherBloc>(context).add(LoadPune());
        }
        return Scaffold(
          backgroundColor: Colors.blue[500],
          appBar: AppBar(
            title: Text("Weather App"),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 10,
                child: state is WeatherLoading
                    ? LinearProgressIndicator()
                    : Container(),
              ),
              Container(
                  color: Colors.blue[500],
                  width: deviceWidth,
                  height: deviceHeight / 3,
                  child: BlocProvider.value(
                    value: BlocProvider.of<WeatherBloc>(context),
                    child: LocationSelector(),
                  )),
              Expanded(
                child: Container(
                  width: deviceWidth,
                  padding: EdgeInsets.fromLTRB(24, 50, 24, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(41),
                      topRight: Radius.circular(41),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomCard(
                                leadingIcon: Icon(
                                  Icons.thermostat_outlined,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                title: "Min Temp",
                                data: (state is WeatherInitial ||
                                        state is WeatherLoading)
                                    ? "0"
                                    : num.parse((state.responseData['main']
                                                    ['temp_min'] -
                                                273.0)
                                            .toStringAsFixed(2))
                                        .toString(),
                                unit: "°c",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            Expanded(
                              child: CustomCard(
                                title: "Max Temp",
                                leadingIcon: Icon(
                                  Icons.thermostat_outlined,
                                  size: 50,
                                  color: Colors.red,
                                ),
                                data: (state is WeatherInitial ||
                                        state is WeatherLoading)
                                    ? "0"
                                    : num.parse((state.responseData['main']
                                                    ['temp_max'] -
                                                273.0)
                                            .toStringAsFixed(2))
                                        .toString(),
                                unit: "°c",
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomCard(
                                leadingIcon: Icon(
                                  Icons.water_damage_rounded,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                title: "Humidity",
                                data: (state is WeatherInitial ||
                                        state is WeatherLoading)
                                    ? "0"
                                    : (state.responseData['wind']['speed'])
                                        .toString(),
                                unit: "%",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(20),
                            ),
                            Expanded(
                              child: CustomCard(
                                title: "Wind Rate",
                                leadingIcon: Icon(
                                  Icons.cloud_circle,
                                  size: 50,
                                  color: Colors.blue,
                                ),
                                data: (state is WeatherInitial ||
                                        state is WeatherLoading)
                                    ? "0"
                                    : (state.responseData['main']['humidity'])
                                        .toString(),
                                unit: "mph",
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
        ;
      },
    );
  }
}
