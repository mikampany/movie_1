import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/movie_list_service.dart';
import 'package:stacked/stacked.dart';

final _movieListService = locator<MovieListService>();

class SmartMovieListModel extends StreamViewModel {
  ReactiveList<TMDBMovieBasic> get movieList => _movieListService.movieList;

  @override
  Stream get stream => _movieListService.movieList.onChange;

  @override
  void onData(data) {
    print(data.op);
    // TODO: implement onData
    super.onData(data);
    rebuildUi();
  }
}
