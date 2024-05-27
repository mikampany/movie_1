import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/ui/smol_widgets/search_tag.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class SearchViewModel extends BaseViewModel {
  final genreList = _apiService.genres;
  var searchTags = <SearchTag>[];

  final TextEditingController searchController = TextEditingController();

  void search() {
    final String text = searchController.text;
    if (genreList.containsKey(text)) {}
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
