import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu_10_movie_db/model/popular_movies.dart';

class ApiProvider {
  String apiKey = 'd73b38b08e9e7af67b7cb18ca49b872d';
  String baseUrl = 'https://api.themoviedb.org/3';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    Response response =
        await client.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      return PopularMovies.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}
