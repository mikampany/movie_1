import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'movie_page_viewmodel.dart';

class MoviePageView extends StackedView<MoviePageViewModel> {
  const MoviePageView({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget builder(
    BuildContext context,
    MoviePageViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  MoviePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MoviePageViewModel(id:id);
}
