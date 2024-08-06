import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_durumu_haftalik_app/Model/model_weather.dart';

class WeatherServices {
  Future<String> _getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      Future.error('Konum servisiniz kapali');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied)
        Future.error('Konum izni Vermelisiniz');
    }

    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);

    final List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    return "${placemark[0].locality}, ${placemark[0].administrativeArea}";
  }

  Future<List<WeatherModel>> getWeatherdata() async {
    final String city = await _getLocation();
    final String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city= $city';

    const Map<String, dynamic> headers = {
      'authorization': 'apikey 5lsyF6wJ80MHKF11D2QEF4:1zgLQpFwIcpm0PCHR9x8gA',
      'content-type': 'application/json'
    };

    final dio = Dio();

    final response = await dio.get(url,
        options: Options(
          headers: headers,
          method: 'GET',
        ));

    if (response.statusCode != 200) {
      return Future.error('Hata olustu');
    }

    final List list = response.data['result'];

    final List<WeatherModel> weatherList =
        list.map((e) => WeatherModel.fromJson(e)).toList();

    return weatherList;
  }
}
