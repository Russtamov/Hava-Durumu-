class WeatherModel {
  final String gun;
  final String icon;
  final String durum;
  final String derece;
  final String min;
  final String max;
  final String gece;
  final String nem;

  WeatherModel(
      {required this.icon,
      required this.gun,
      required this.durum,
      required this.derece,
      required this.min,
      required this.max,
      required this.gece,
      required this.nem});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : icon = json['icon'],
        gun = json['date'],
        durum = json["baslik"],
        derece = json["derece"],
        min = json["min"],
        max = json["max"],
        gece = json["gece"],
        nem = json["nem"];

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "baslik": durum,
        "derece": derece,
        "min": min,
        "max": max,
        "gece": gece,
        "nem": nem
      };
} 












/* class WeatherModel {
    final bool success;
    final String city;
    final List<Result> result;

    WeatherModel({
        required this.success,
        required this.city,
        required this.result,
    });

}

class Result {
    final String date;
    final String day;
    final String icon;
    final String description;
    final String status;
    final String degree;
    final String min;
    final String max;
    final String night;
    final String humidity;

    Result({
        required this.date,
        required this.day,
        required this.icon,
        required this.description,
        required this.status,
        required this.degree,
        required this.min,
        required this.max,
        required this.night,
        required this.humidity,
    });

}

 */













