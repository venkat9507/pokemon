
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/pokemon_list_api/pokemon_list_api.dart';
import '../../modals/pokemons_list/pokemons_list_modals.dart';

class PokemonListController extends GetxController {
  static PokemonListController instance = Get.find();
  String apiUrl = 'https://pokedex.alansantos.dev';
  RxList<PekemonsListModels>? pokemonsListModels = <PekemonsListModels>[].obs;
  RxList<PekemonsListModels>? filteredPokemonListModels = <PekemonsListModels>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  Future<void> getData() async {


    final response = await PokemonListApi.getPokemonList();

    if(response.statusCode == 200){
      pokemonsListModels?.value = pekemonsListModelsFromJson(response.body);

      // for(var pokemons in pokemonsListModels!){
      //
      //   debugPrint('checking the name of Pokemons ${pokemons.name}');
      //
      // }
    }
    else {
      Get.snackbar('Error', 'Sorry Error Occurred ');
    }

  }

  // search category
  void searchCat(String searchStr) {
    filteredPokemonListModels?.clear();
    for (var item in pokemonsListModels!) {
      if (item.name.contains(RegExp(searchStr, caseSensitive: false))) {
        filteredPokemonListModels?.add(
          item
        );
      }
    }
    // print(filteredPokemonListModels);
    update();
  }

}