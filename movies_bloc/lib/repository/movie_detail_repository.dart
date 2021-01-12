import 'package:movies_bloc/api_key.dart';
import 'package:movies_bloc/models/movie_response.dart';
import 'package:movies_bloc/networking/api_base_helper.dart';

class MovieDetailRepository {
  final String _apiKey = apiKey;

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<Movie> fetchMovieDetail(int selectedMovie) async {
    final response = await _helper.get('movie/$selectedMovie?api_key=$_apiKey');
    return Movie.fromJson(response);
  }
}
