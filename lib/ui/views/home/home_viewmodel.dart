import 'package:movie/app/app.bottomsheets.dart';
import 'package:movie/app/app.dialogs.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/ui/common/app_strings.dart';
import 'package:movie/ui/smol_widgets/movie_list.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

final _apiService = locator<ApiService>();

class HomeViewModel extends BaseViewModel {
  List<TMDBMovieBasic> movies = [];

  Future popularMovies() async {
    var res = await _apiService.popularMovies();
    movies = res.results;
    notifyListeners();
  }

  runStartupLogic() async {
    await popularMovies();
  }
}
