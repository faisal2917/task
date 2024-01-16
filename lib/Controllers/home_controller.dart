import 'package:get/get.dart';
import 'package:movie_api_task/Model/movie_model.dart';
import 'package:movie_api_task/Services/movie_services.dart';

class HomeController extends GetxController {
  MovieService movieService = MovieService();
  bool isFaverout = false;
  List<Movie> moviesList = [];
  List<Movie> favoriteMovies = [];

  String gnText = "hello world";
  Future<List<Movie>> fetchMovie() async {
    moviesList = await movieService.fetchMovies();
    print("items length" + moviesList.length.toString());

    // isLoading = false;
    update();

    return moviesList;
  }

  faverout() {
    isFaverout = !isFaverout;
    update(['updateButton']);
  }
}
