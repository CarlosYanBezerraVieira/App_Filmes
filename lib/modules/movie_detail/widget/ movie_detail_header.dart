import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetailModel? movie;
  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieData = movie;
    if (movieData != null) {
      return SizedBox(
        height: 270,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieData.urlImage.length,
            itemBuilder: (contex, index) {
              final image = movieData.urlImage[index];
              return Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(image),
              );
            }),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
