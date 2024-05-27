import 'package:dio/dio.dart';

final String API_ACCESS_TOKEN =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNTMxOTk1MmRkZmY1OTMyYjk3MGM4NWVkYTYwYmNiNiIsInN1YiI6IjY2NTQwYWNkZTA5OTk4NjM2YjRjZDI1MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJtYvX_j1nAGaebMv9XQwQIQFU5T3jDRqCYSlAcFS-o';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org',
    headers: {
      'Accept': 'Application/Json',
      'Authorization': 'Bearer $API_ACCESS_TOKEN',
      'Host': 'api.themoviedb.org'
    },
  ),
);
void main() async {
  String requestUrl = '/3/discover/movie?with_genres=16%2C35';
  var queryParams = {'with_genres': 16};
  var res = await dio.get(requestUrl);
  print(res);
}
