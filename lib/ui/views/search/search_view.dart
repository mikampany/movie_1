import 'package:flutter/material.dart';
import 'package:movie/ui/views/results/results_view.dart';
import 'package:stacked/stacked.dart';

import 'search_viewmodel.dart';

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search your favourite genre'),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              viewModel.addTag(value);
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  viewModel.search();
                },
                icon: const Icon(Icons.search),
              ),
            ),
            controller: viewModel.searchController,
          ),
          Row(
            children: viewModel.searchTags,
          ),
        ],
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
