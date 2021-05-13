import 'package:my_movies/models/movieModel.dart';
import 'package:my_movies/networking/apiBaseHelper.dart';

class MovieRepository {
  final String _apikey = "8c50b78fd95f7de22a535ec79748d231";
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<List<Movie>> fetchMovieList() async {
    final response = await _helper.get("movie/popular?api_key=$_apikey");
    return MovieResponse.fromJson(response).results;
  }
}
