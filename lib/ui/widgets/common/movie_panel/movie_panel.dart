import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/services/api_service.dart';
import 'package:stacked/stacked.dart';

import 'movie_panel_model.dart';

class MoviePanel extends StackedView<MoviePanelModel> {
  const MoviePanel(
      {super.key,
      required this.id,
      required this.title,
      this.genreIds = const [],
      this.posterPath,
      this.overview});

  final String title;
  final int id;
  final List<int> genreIds;
  final String? posterPath;
  final String? overview;

  @override
  Widget builder(
    BuildContext context,
    MoviePanelModel viewModel,
    Widget? child,
  ) {
    final _apiService = locator<ApiService>();
    return GestureDetector(
      onTap: () async {
        await viewModel.navigateToMoviePage(id: id);
      },
      child: viewModel.isBusy
          ? const SizedBox(
              height: 500,
              width: 500,
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Image(
                  image: NetworkImage(
                    _apiService.getImgSrc(posterPath),
                  ),
                ),
                // Text('Title:$title'),
                // SizedBox(
                //     height: 20,
                //     child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children:
                //             genreIds.map((g) => Text(' $g ')).toList())),
                // Text(overview ?? ''),
                // Text(posterPath ?? ''),
              ],
            ),
    );
  }

  @override
  MoviePanelModel viewModelBuilder(
    BuildContext context,
  ) =>
      MoviePanelModel();
}
