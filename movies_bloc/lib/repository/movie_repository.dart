import 'package:movies_bloc/api_key.dart';
import 'package:movies_bloc/models/movie_response.dart';
import 'package:movies_bloc/networking/api_base_helper.dart';

class MovieRepository {
  final String _apiKey = apiKey;

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apiKey");
    return MovieResponse.fromJson(response).results;
  }
}
