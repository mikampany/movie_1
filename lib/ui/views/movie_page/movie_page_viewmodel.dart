import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';

final _apiService = locator<ApiService>();

class MoviePageViewModel extends FutureViewModel<String> {
  MoviePageViewModel();

  @override
  Future<String> futureToRun() async {
    return 'hello';
  }

  Image movieImage(String? path) {
    Image image = Image(image: NetworkImage(_apiService.getImgSrc(path)));
    return image;
  }

  goBack() {}
}
