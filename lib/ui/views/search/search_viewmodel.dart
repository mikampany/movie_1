import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:movie/ui/smol_widgets/search_tag.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class SearchViewModel extends BaseViewModel {
  final genreList = _apiService.genres;
  final searchTags = <SearchTag>{
    SearchTag(
      tagName: 'Hello1',
      delete: (String name) {},
    )
  };
  final TextEditingController searchController = TextEditingController();
  void search() {
    final String text = searchController.text;
    if (genreList.containsKey(text)) {}
  }

  // void addTag(String tagName) {
  //   SearchTag sw = SearchTag(tagName: tagName, delete: delete);
  //   searchTags.add(sw);
  // }

  void delete(String name) {
    searchTags.remove(name);
  }
}
