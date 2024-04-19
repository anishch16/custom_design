import 'dart:developer';

import 'package:custom/blocs/weather_bloc.dart';
import 'package:custom/events/weather_event.dart';
import 'package:custom/states/weather_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../blocs/app_blocs.dart';
import '../events/app_events.dart';
import '../model/model.dart';
import '../model/weatheer_model.dart';
import '../repository/repo.dart';
import '../states/app_states.dart';

class ScreenView extends StatelessWidget {
  const ScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
        BlocProvider<WeatherBloc>(
          create: (BuildContext context) => WeatherBloc(UserRepository()),
        ),
      ],
      child: Scaffold(
          backgroundColor: const Color(0xff040273),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: weatherBody(),
            ),
          )),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                            title: Text(
                              '${userList[index].firstName}  ${userList[index].lastName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${userList[index].email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].avatar.toString()),
                            ))),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }

  Widget weatherBody() {
    return BlocProvider(
      create: (context) => WeatherBloc(
        UserRepository(),
      )..add(LoadWeatherEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadedState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Image.asset(
                  //   getImageAssetPath(state.weather.current?.temperature2m ?? 0,
                  //       state.weather.current?.windSpeed10m ?? 0),
                  //   height: 300,
                  //   width: 300,
                  // ),
                  const Text(
                      "Panchkhal ",
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white)),
                  const SizedBox(height: 32),
                  Text(
                      "${state.weather.current?.temperature2m}${state.weather.hourlyUnits?.temperature2m}",
                      style: const TextStyle(
                          fontSize: 54, fontWeight: FontWeight.bold,color: Colors.white)),

                  Text(
                    extractTime(
                      state.weather.current?.time.toString() ?? "n/a",
                    ),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    formatDateTime(
                      state.weather.current?.time.toString() ?? "n/a",
                    ),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  // Text("Latitude: ${state.weather.longitude}",
                  //     style: const TextStyle(
                  //         fontSize: 16, fontWeight: FontWeight.bold)),
                  // Text("Generation Time: ${state.weather.generationtimeMs}",
                  //     style: const TextStyle(
                  //         fontSize: 16, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 32),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.weather.hourly?.time?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue.withOpacity(0.4),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  formatDateTime(
                                    state.weather.hourly?.time?[index]
                                            .toString() ??
                                        "n/a",
                                  ),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Text(
                                  extractTime(
                                    state.weather.hourly?.time?[index]
                                            .toString() ??
                                        "n/a",
                                  ),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Image.asset(
                                  getImageAssetPath(
                                      state.weather.hourly
                                              ?.temperature2m?[index] ??
                                          0,
                                      state.weather.hourly
                                              ?.windSpeed10m?[index] ??
                                          0),
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "Temperature: ${state.weather.hourly?.temperature2m?[index].toString() ?? "n/a"}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Text(
                                  "Humidity: ${state.weather.hourly?.relativeHumidity2m?[index].toString() ?? "n/a"}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                Text(
                                  "Wind Speed: ${state.weather.hourly?.windSpeed10m?[index].toString() ?? "n/a"}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeatherErrorState) {
            log("Error::::::::${state.error}");
            return Text('Error: ${state.error}');
          }
          return Container(); // Placeholder widget if none of the above states match
        },
      ),
    );
  }

  String extractTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    final DateFormat formatter = DateFormat.jm();
    return formatter.format(dateTime);
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    final DateFormat formatter = DateFormat.yMMMMd();
    return formatter.format(dateTime);
  }

  String getImageAssetPath(num temperature, num windSpeed) {
    if (windSpeed >= 15) {
      return "assets/Tornado.png";
    }
    if (temperature >= 20) {
      return "assets/Sun cloud angled rain.png";
    }
    if (temperature <= 10) {
      if (windSpeed >= 10) {
        return "assets/Moon cloud fast wind.png";
      } else {
        return "assets/Moon cloud mid rain.png";
      }
    }
    return "assets/Sun cloud angled rain.png";
  }
}
