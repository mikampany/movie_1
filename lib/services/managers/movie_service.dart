import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';

final _apiService = locator<ApiService>();

class MovieService {
  late TMDBMovieBasic movie;
}
