import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/services/movie_list_service.dart';
import 'package:movie/ui/smol_widgets/search_tag.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();
final _movieListService = locator<MovieListService>();

class SearchViewModel extends BaseViewModel {
  final genreList = _apiService.genres;
  List<SearchTag> searchTags = [];

  final TextEditingController searchController = TextEditingController();

  Future searchWithGenre() async {
    if (searchTags.isEmpty) return;
    var res = await _apiService.searchWithGenre(
        searchTags.map((searchTag) => genreList[searchTag.tagName]).toList());
    return res.results;
  }

  Future searchWithQuery() async {
    var res = await _apiService.searchByQuery(query: searchController.text);
    return res.results;
  }

  void search() async {
    List<TMDBMovieBasic> movieList = searchController.text.isNotEmpty
        ? await searchWithQuery()
        : await searchWithGenre();

    _movieListService.movieList.assignAll(movieList);
  }

  void addTag(String tagName) {
    if (!genreList.containsKey(tagName.toLowerCase())) return;
    SearchTag sw =
        SearchTag(tagName: tagName, delete: () => deleteTag(tagName));
    searchController.text = "";
    searchTags.add(sw);
    notifyListeners();
  }

  void deleteTag(String name) {
    searchTags =
        searchTags.where((searchTag) => searchTag.tagName != name).toList();
    notifyListeners();
  }
}
