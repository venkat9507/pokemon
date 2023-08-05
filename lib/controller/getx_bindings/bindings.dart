
import 'package:e2_info/controller/pokemons_list_controller/pokemons_list_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PokemonListController(),fenix: true);
  }

}