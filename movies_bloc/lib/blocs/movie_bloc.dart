import 'dart:async';
import 'package:movies_bloc/models/movie_response.dart';
import 'package:movies_bloc/networking/api_response.dart';
import 'package:movies_bloc/repository/movie_repository.dart';

class MovieBloc {
  MovieRepository _movieRepository;

  StreamController _movieListController;

  MovieBloc() {
    _movieRepository = MovieRepository();
    _movieListController = StreamController<ApiResponse<List<Movie>>>();
    fetchMovieList();
  }

  StreamSink<ApiResponse<List<Movie>>> get movieListSink =>
      _movieListController.sink;

  Stream<ApiResponse<List<Movie>>> get movieListStream =>
      _movieListController.stream;

  fetchMovieList() async {
    movieListSink.add(ApiResponse.loading('Fetch Movies'));
    try {
      List<Movie> movies = await _movieRepository.fetchMovieList();
      movieListSink.add(ApiResponse.completed(movies));
    } catch (e) {
      movieListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _movieListController.close();
  }
}
