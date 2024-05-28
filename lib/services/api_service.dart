import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie/models/tmdb/tmdb_movies_response.dart';

final String _API_ACCESS_TOKEN =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTMxOTk1MmRkZmY1OTMyYjk3MGM4NWVkYTYwYmNiNiIsInN1YiI6IjY2NTQwYWNkZTA5OTk4NjM2YjRjZDI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJtYvX_j1nAGaebMv9XQwQIQFU5T3jDRqCYSlAcFS-o';

const String imgUrl = 'http://image.tmdb.org/t/p/w500';

class ApiService {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org',
      headers: {
        'Accept': 'Application/Json',
        'Authorization': 'Bearer $_API_ACCESS_TOKEN',
        'Host': 'api.themoviedb.org'
      },
    ),
  );
  var genres = {};
  Future<bool> authenticate() async {
    // **wrap with try-catch later
    var res = await dio.get('/3/authentication');
    return res.statusCode == 200;
  }

  Future storeMovieGenreList() async {
    var res = await dio.get('/3/genre/movie/list');

    for (var mapItem in res.data['genres']) {
      genres[mapItem['name'].toString().toLowerCase()] =
          mapItem['id'].toString();
    }
    print(genres);
  }

  Future<TMDBMoviesResponse> searchWithGenre(List<dynamic> queries) async {
    String apiUrl = '/3/discover/movie?with_genres=${queries.join('&')}';
    var res = await dio.get(apiUrl);
    return TMDBMoviesResponse.fromJson(res.data);
  }

  Future<TMDBMoviesResponse> popularMovies() async {
    String apiUrl = '/3/movie/popular';
    var res = await dio.get(apiUrl);

    return TMDBMoviesResponse.fromJson(res.data);
  }

  String getImgSrc(String? posterPath) {
    if (posterPath == null) {
      return 'https://th.bing.com/th/id/OIP.hMlLJSmMJky9Rd1JwB86VgHaFl?rs=1&pid=ImgDetMain';
    }
    return imgUrl + posterPath;
  }
}
