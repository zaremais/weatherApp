import 'package:flutter/material.dart';

import '../../../../internal/helpers/format_helpers.dart';
import '../../data/models/weather_model.dart';

class WeatherInfoScreen extends StatefulWidget {
  final WeatherModel? weatherModel;
  const WeatherInfoScreen({super.key, this.weatherModel});

  @override
  State<WeatherInfoScreen> createState() => _WeatherInfoScreenState();
}

class _WeatherInfoScreenState extends State<WeatherInfoScreen> {
  final String apiKey = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 15),
                child: Text(
                  getDateFormat(widget.weatherModel!.dt!).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                getTimeFormat(widget.weatherModel!.dt!).toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.network(
                                'http://openweathermap.org/img/wn/${widget.weatherModel!.weather!.first.icon}@4x.png'),
                          ),
                          Text(
                            '${getCelcFormat(widget.weatherModel!.main!.temp!)}°C',
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'wind speed ${widget.weatherModel!.wind!.speed}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            DateTime.now().weekday.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            height: 2,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Mist',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: Image.network(
                                        ('http://openweathermap.org/img/wn/${widget.weatherModel!.weather!.first.icon}@4x.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Rain',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.network(
                                        'http://openweathermap.org/img/wn/${widget.weatherModel!.weather![0].icon}@4x.png'),
                                    // 'http://openweathermap.org/img/wn/10d@4x.png'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Few clouds',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.network(
                                        'http://openweathermap.org/img/wn/02d@4x.png'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Snow',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Image.network(
                                        'http://openweathermap.org/img/wn/13d@4x.png'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
