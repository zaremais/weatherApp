import 'package:flutter/material.dart';
import 'package:flutter_application_42/cubit/weather_cubit.dart';
import 'package:flutter_application_42/helpers/error_helpers.dart';
import 'package:flutter_application_42/screens/weather_info_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherSearchScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  WeatherSearchScreen({
    Key? key,
  }) : super(key: key);
  final WeatherCubit weatherCubit = WeatherCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   decoration: const BoxDecoration(

        //     gradient: LinearGradient(colors: [
        //       Color.fromARGB(255, 205, 197, 213),
        //       Color(0xff3fa2fa),
        //     ], begin: Alignment.bottomCenter, end: Alignment.topCenter),

        //   ),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/clear.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocConsumer<WeatherCubit, WeatherState>(
            bloc: weatherCubit,
            listener: (context, state) {
              if (state is WeatherFetched) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return WeatherInfoScreen(
                        weatherModel: state.weatherModel,
                      );
                    }),
                  ),
                );
              }
              if (state is WeatherError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(getErrors(context, state.error)),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(255, 154, 217, 251),
                        hintText: "Название города",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state is WeatherLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(370, 60),
                                backgroundColor:
                                    const Color.fromARGB(255, 154, 217, 251)),
                            onPressed: () {
                              weatherCubit.getWeather(city: controller.text);
                            },
                            child: const Text(
                              'Search city',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
