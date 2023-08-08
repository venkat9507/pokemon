
import 'package:e2_info/screen/details_screen/pokemon_details_screen.dart';
import 'package:e2_info/screen/search/search_screen_view.dart';
import 'package:get/get.dart';

import '../../screen/landing_screen_view/pokemon_list_screen.dart';

class Routes {
  static final routes = [

    GetPage(
      name: '/',
  transition: Transition.zoom,
  page: () => PokemonListScreen(),

    ),
GetPage(
      name: '/search',
  transition: Transition.zoom,
  page: () => SearchScreen(),
    ),
    GetPage(
      name: '/pokemon-details',
  // transition: Transition.zoom,
  page: () => PokemonDetails(),
    ),

  ];
}