import 'package:app_filmes/application/ui/filmes_app_icons_icons.dart';
import 'package:app_filmes/modules/favorites/favorites/favorites_bindings.dart';
import 'package:app_filmes/modules/favorites/favorites/favorites_page.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:app_filmes/modules/movies/movies_page.dart';
import 'package:app_filmes/modules/movies/movies_bindins.dart';
import 'package:flutter/material.dart';
import 'package:app_filmes/application/ui/them_extension.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Filmes"),
            BottomNavigationBarItem(
                icon: Icon(FilmesAppIcons.heart_empty_1), label: "Favoritos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: "Sair"),
          ],
        );
      }),
      body: Navigator(
        initialRoute: "/movies",
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == "/movies") {
            return GetPageRoute(
              settings: settings,
              page: () => const MoviesPage(),
              binding: MoviesBindins(),
            );
          }
          if (settings.name == "/favorites") {
            return GetPageRoute(
                settings: settings,
                page: () => const FavoritesPage(),
                binding: FavoritesBindings());
          }
          return null;
        },
      ),
    );
  }
}
