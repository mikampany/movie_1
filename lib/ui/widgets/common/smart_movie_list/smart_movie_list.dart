import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'smart_movie_list_model.dart';

class SmartMovieList extends StackedView<SmartMovieListModel> {
  const SmartMovieList({super.key});

  @override
  Widget builder(
    BuildContext context,
    SmartMovieListModel viewModel,
    Widget? child,
  ) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: viewModel.movieList.map((val) => Text(val.title)).toList(),
        ),
      ),
      viewModelBuilder: () => SmartMovieListModel(),
    );
  }

  @override
  SmartMovieListModel viewModelBuilder(
    BuildContext context,
  ) =>
      SmartMovieListModel();
}
