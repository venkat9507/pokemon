
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/pokemon_list_api/pokemon_list_api.dart';
import '../../modals/pokemons_list/pokemons_list_modals.dart';

class PokemonListController extends GetxController {
  static PokemonListController instance = Get.find();
  String apiUrl = 'https://pokedex.alansantos.dev';
  List<PekemonsListModels>? pokemonsListModels;


  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    print('get data triggered');

    final response = await PokemonListApi.getPokemonList();

    if(response.statusCode == 200){
      pokemonsListModels = pekemonsListModelsFromJson(response.body);

      for(var pokemons in pokemonsListModels!){

        debugPrint('checking the name of Pokemons ${pokemons.name}');

      }
    }
    else {
      Get.snackbar('Error', 'Sorry Error Occurred ');
    }

  }
}