import 'dart:async';
import 'package:movies_bloc/models/movie_response.dart';
import 'package:movies_bloc/networking/api_response.dart';
import 'package:movies_bloc/repository/movie_detail_repository.dart';

class MovieDetailBloc {
  MovieDetailRepository _movieDetailRepository;

  StreamController _movieDetailController;

  MovieDetailBloc(selectedMovie) {
    _movieDetailRepository = MovieDetailRepository();
    _movieDetailController = StreamController<ApiResponse<Movie>>();
    fetchMovieDetail(selectedMovie);
  }

  StreamSink<ApiResponse<Movie>> get movieDetailSink =>
      _movieDetailController.sink;

  Stream<ApiResponse<Movie>> get movieDetailStream =>
      _movieDetailController.stream;

  fetchMovieDetail(int selectedMovie) async {
    movieDetailSink.add(ApiResponse.loading('Fetching Details'));
    try {
      Movie detail =
          await _movieDetailRepository.fetchMovieDetail(selectedMovie);
      movieDetailSink.add(ApiResponse.completed(detail));
    } catch (e) {
      movieDetailSink.add(ApiResponse.error(e.toString()));
    }
  }

  dispose() {
    _movieDetailController.close();
  }
}
