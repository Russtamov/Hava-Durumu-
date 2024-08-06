import 'package:flutter/material.dart';
import 'package:hava_durumu_haftalik_app/Model/model_weather.dart';
import 'package:hava_durumu_haftalik_app/Services/weather_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<WeatherModel> _weathers = [];

  @override
  void initState() {
    _getWeatherData();
    super.initState();
    setState(() {});
  }

  void _getWeatherData() async {
    _weathers = await WeatherServices().getWeatherdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Haftalık Hava Durumu'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _weathers.length,
            itemBuilder: (context, index) {
              final WeatherModel weather = _weathers[index];
              return Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.teal,
                ),
                child: Column(
                  children: [
                    Image.network(weather.icon),
                    Text('Date: ${weather.gece}'),
                    Text('Day: ${weather.gun}'),
                    Text('Min: ${weather.min}'),
                    Text('Max: ${weather.max}'),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
