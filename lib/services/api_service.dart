import 'package:dio/dio.dart';

final String _API_ACCESS_TOKEN =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTMxOTk1MmRkZmY1OTMyYjk3MGM4NWVkYTYwYmNiNiIsInN1YiI6IjY2NTQwYWNkZTA5OTk4NjM2YjRjZDI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJtYvX_j1nAGaebMv9XQwQIQFU5T3jDRqCYSlAcFS-o';

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
      genres[mapItem['name'].toString().toLowerCase()] = mapItem['id'];
    }
    print(genres);
  }

  Future<void> searchWithGenre(List<dynamic> queries) async {
    String api_url = '/3/discover/movie?with_genres=${queries.join('&')}';
    var res = await dio.get(api_url);
    print(res);
  }
}
