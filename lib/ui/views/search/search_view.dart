import 'package:flutter/material.dart';
import 'package:movie/ui/smol_widgets/movie_list.dart';
import 'package:movie/ui/widgets/common/movie_panel/movie_panel.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) {
                viewModel.addTag(value);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    viewModel.searchWithGenre();
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
              controller: viewModel.searchController,
            ),
            Row(
              children: viewModel.searchTags,
            ),
            if (viewModel.movies.isNotEmpty)
              MovieList(movies: viewModel.movies),
          ],
        ),
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SearchViewModel();
}
