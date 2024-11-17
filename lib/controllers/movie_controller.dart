import 'package:get/get.dart';
import 'package:movieio/models/models.dart';
import 'package:movieio/services/api_services.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;
  var isLoading = false.obs;

  // Fetch all movies
  void fetchAllMovies() async {
    isLoading.value = true;
    try {
      final response = await ApiService.fetchMovies('all');
      movies.value =
          response.map<Movie>((json) => Movie.fromJson(json)).toList();
    } finally {
      isLoading.value = false;
    }
  }

  // Search movies
  void searchMovies(String query) async {
    isLoading.value = true;
    try {
      final response = await ApiService.fetchMovies(query);
      movies.value =
          response.map<Movie>((json) => Movie.fromJson(json)).toList();
    } finally {
      isLoading.value = false;
    }
  }
}
