import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/application/model/movie_model.dart';

class MovieService {
  static const _apiKey = 'f0f46b532513ee4aab46515cf5603265';
  static const _baseUrl = 'https://api.themoviedb.org/3/movie/';

  static const _nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=f0f46b532513ee4aab46515cf5603265';
  static const _upcomming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=f0f46b532513ee4aab46515cf5603265';

  static String _popular =
      'https://api.themoviedb.org/3/movie/popular?api_key=f0f46b532513ee4aab46515cf5603265';

  static Future<List<Movie>> getNowPlayingMovies() async {
    final int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final response = await http.get(Uri.parse(_nowplaying));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error fetching now playing movies: $e');
      }

      retryCount++;
    }

    return [];
  }

  static Future<List<Movie>> getTopRatedMovies() async {
    final int maxtries = 3;
    int retrycout = 0;
    while (retrycout < maxtries) {
      try {
        final response =
            await http.get(Uri.parse('$_baseUrl/top_rated?api_key=$_apiKey'));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retrycout++;
    }
    return [];
  }

  static Future<List<Movie>> getPopularMovies() async {
    int maxtries = 3;
    int retryCount = 0;
    while (retryCount < maxtries) {
      try {
        final response = await http.get(Uri.parse(_popular));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retryCount++;
    }
    return [];
  }

  static Future<List<Movie>> getUpCommingmovies() async {
    final int maxtries = 3;
    int retrycount = 0;
    while (retrycount < maxtries) {
      try {
        final response = await http.get(Uri.parse(_upcomming));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retrycount++;
    }
    return [];
  }


}
