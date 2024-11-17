import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import 'search_screen.dart';
import '../widgets/movie_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    movieController.fetchAllMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies.io',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Get.to(SearchScreen()),
          ),
        ],
      ),
      body: Obx(() {
        if (movieController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: movieController.movies.length,
          itemBuilder: (context, index) {
            return MovieCard(movie: movieController.movies[index]);
          },
        );
      }),
    );
  }
}
