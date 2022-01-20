import 'package:app_filmes/application/ui/widget/movie_card.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesGroup extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
              height: 280,
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (contex, index) {
                    return MovieCard(
                      movie: movies[index],
                    );
                  },
                );
              }))
        ],
      ),
    );
  }
}
