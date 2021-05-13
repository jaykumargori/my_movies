import 'package:my_movies/models/movieModel.dart';
import 'package:my_movies/networking/apiBaseHelper.dart';

class MovieDetailRepository {
  final String _apiKey = "8c50b78fd95f7de22a535ec79748d231";
  ApiBaseHelper _helper = ApiBaseHelper();

  MovieDetailRepository();

  Future<Movie> fetchMovieDetail(int selectedMovie) async {
    final response = await _helper.get("movie/$selectedMovie?api_key=$_apiKey");
    return Movie.fromJson(response);
  }
}
