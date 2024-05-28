import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'movie_panel_model.dart';

class MoviePanel extends StackedView<MoviePanelModel> {
  const MoviePanel(
      {super.key,
      required this.id,
      required this.title,
      this.genreIds = const [],
      this.imgSrc,
      this.overview});

  final String title;
  final int id;
  final List<int> genreIds;
  final String? imgSrc;
  final String? overview;

  @override
  Widget builder(
    BuildContext context,
    MoviePanelModel viewModel,
    Widget? child,
  ) {
    print("Genres: ${viewModel.genres}");
    return GestureDetector(
      onTap: () {},
      child: Expanded(
        child: Column(
          children: [
            Text('No.:$id Title:$title'),
            
          ],
        ),
      ),
    );
  }

  @override
  MoviePanelModel viewModelBuilder(
    BuildContext context,
  ) =>
      MoviePanelModel(
          title: title,
          id: id,
          imgSrc: imgSrc,
          genreIds: genreIds,
          overview: overview);
}
