import 'package:dart_ipify/dart_ipify.dart';
import 'package:dio/dio.dart';
import 'package:time_zone/src/models/time_zone_card_model.dart';

class ApiService {
  Dio dio = Dio();
  final String baseUrl = 'https://timeapi.io/api/time/current/zone';
  Future<TimeZoneCardModel> getTime(String timeZone) async {
    Response response = await dio.get('$baseUrl?timeZone=$timeZone');
    final TimeZoneCardModel timeZoneCardModel =
        TimeZoneCardModel.fromJson(response.data);
    return timeZoneCardModel;
  }

  Future<TimeZoneCardModel> getTimebyIP() async {
    final ipv4 = await Ipify.ipv4();
    Response response =
        await dio.get('https://timeapi.io/api/time/current/ip?ipAddress=$ipv4');
    final TimeZoneCardModel timeZoneCardModel =
        TimeZoneCardModel.fromJson(response.data);
    return timeZoneCardModel;
  }
}
