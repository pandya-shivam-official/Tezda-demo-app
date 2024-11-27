import 'package:dio/dio.dart';
import 'package:demo_application/model/home_model.dart';

class HomeScreenApi {
  static Future<List<HomeModel>> fetchData() async {
    const url = 'https://protocoderspoint.com/jsondata/superheros.json';

    final response = await Dio().get(url);
    final result = response.data['superheros'] as List<dynamic>;
    final users = result.map((e) {
      return HomeModel.fromMap(e);
    }).toList();
    return users;
  }
}
