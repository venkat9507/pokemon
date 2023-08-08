
import 'package:e2_info/controller/pokemons_list_controller/pokemons_list_controller.dart';
import 'package:get/get.dart';

import '../pokemon_details_controller/pokemon_details_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PokemonListController(),fenix: true);
    Get.lazyPut(() => PokemonDetailsController(),fenix: true);
  }

}