import 'package:flutter/material.dart';
import 'package:movie/app/app.locator.dart';
import 'package:movie/app/app.router.dart';
import 'package:movie/ui/smol_widgets/movie_list.dart';
import 'package:movie/ui/widgets/common/movie_panel/movie_panel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'search_viewmodel.dart';

final _navigationService = locator<NavigationService>();

class SearchView extends StackedView<SearchViewModel> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SearchViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _navigationService.replaceWithHomeView(),
      child: Scaffold(
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
              if (viewModel.movies.isNotEmpty)
                MovieList(movies: viewModel.movies),
            ],
          ),
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
