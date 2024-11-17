import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import '../widgets/movie_card.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final MovieController movieController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Movies')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                if (query.isNotEmpty) {
                  movieController.searchMovies(query);
                }
              },
            ),
          ),
          Expanded(
            child: Obx(() {
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
          ),
        ],
      ),
    );
  }
}
