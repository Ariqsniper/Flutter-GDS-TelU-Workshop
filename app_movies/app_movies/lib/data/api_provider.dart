import 'dart:convert';

import 'package:app_movies/model/popular_movies.dart';
import 'package:http/http.dart' show Client, Response;

class ApiProvider {
  String apiKey = '572e9f2c533885e3d1f8d9c7071eb429';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();
   
  Future<PopularMovies> getPopularMovies() async{
    String url = '$baseUrl/movie/popular?api_key=$apiKey';
    print(url);
    Response response = await  client.get(url);
    if (response.statusCode == 200){
      return PopularMovies.fromJson(jsonDecode(response.body));
    }else {
      throw Exception(response.statusCode);
    }
  }
}