import 'package:flutter/material.dart';
import 'package:movie/models/tmdb/tmdb_movie_basic.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies});
  final List<TMDBMovieBasic> movies;

  @override
  Widget build(BuildContext context) {
    List<Text> movieList = movies.map((movie) => Text(movie.title)).toList();
    // print(movieList);
    return SingleChildScrollView(
        child: Column(
      children: movieList,
    ));
  }
}
