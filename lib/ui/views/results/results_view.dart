import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'results_viewmodel.dart';

class ResultsView extends StackedView<ResultsViewModel> {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResultsViewModel viewModel,
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
  ResultsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResultsViewModel();
}
