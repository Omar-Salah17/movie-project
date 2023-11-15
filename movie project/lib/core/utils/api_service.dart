import 'package:dio/dio.dart';

class ApiManager {
  static const baseUrl = 'https://api.themoviedb.org/3';

  Dio dio;

  ApiManager({required this.dio});
//  https://api.themoviedb.org/3/tv/popular?api_key=aaafdf39c924f446327222d80473780a
  Future<Map<String, dynamic>> fetchData({required String endPoints}) async {
    var response = await dio
        .get('$baseUrl/$endPoints?api_key=aaafdf39c924f446327222d80473780a');
    return response.data;
  }
}
