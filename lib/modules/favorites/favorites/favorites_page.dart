import 'package:app_filmes/application/ui/widget/movie_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './favorites_controller.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Favoritos',
          ),
        ),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: controller.movies
                      .map((m) => MovieCard(
                          movie: m,
                          favoriteCallBack: () => controller.removeFavorite(m)))
                      .toList(),
                ),
              ),
            ),
          );
        }));
  }
}
