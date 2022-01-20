import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final dateFormat = DateFormat('y');
  final MovieModel movie;
  MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158,
      height: 280,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      movie.posterPath,
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  dateFormat.format(DateTime.parse(movie.releaseDate)),
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 83,
            right: -5,
            child: Material(
              elevation: 5,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                height: 30,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FilmesAppIcons.heart_1,
                    color: Colors.grey,
                  ),
                  iconSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
