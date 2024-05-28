import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class MoviePanelModel extends BaseViewModel {
  final String title;
  final int id;
  final List<int> genreIds;
  final String? imgSrc;
  final String? overview;
  final genreMap = _apiService.genres;


  MoviePanelModel(
      {required this.title,
      required this.id,
      this.imgSrc,
      this.genreIds = const [],
      this.overview});
}
