import 'package:flutter/material.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';
import 'package:movie/ui/widgets/common/movie_panel/movie_panel.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies});
  final List<TMDBMovieBasic> movies;

  @override
  Widget build(BuildContext context) {
    List<Text> movieList = movies.map((movie) => Text(movie.title)).toList();
    List<MoviePanel> moviePanels = movies
        .map((movie) => MoviePanel(
              id: movie.id,
              title: movie.title,
              genreIds: movie.genreIds ?? [],
            ))
        .toList();
    // print(movieList);
    return Column(
      children: moviePanels,
    );
  }
}
