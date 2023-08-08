
import 'dart:convert';

import 'package:e2_info/api/pokemon-details_api/pokemon-details-api.dart';
import 'package:e2_info/controller/getx_bindings/getx_controller_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/pokemon_list_api/pokemon_list_api.dart';
import '../../modals/pokemons_details/pokemons_details_modals.dart';
import '../../modals/pokemons_list/pokemons_list_modals.dart';

class PokemonDetailsController extends GetxController {
  static PokemonDetailsController instance = Get.find();
  String apiUrl = 'https://pokedex.alansantos.dev';
  int? number;
  // PokemonDetailsModels? pokemonDetailsModels;
   PokemonDetailsModels? pokemonDetailsModels;
  // Rx<PekemonDetailsModels>? pokemonDetailsModels = PekemonDetailsModels(
  //
  //     number: null,
  //     name: null,
  //     nextEvolutions: null, imageUrl: null, thumbnailUrl: null, sprites: null, types: null, weaknesses: null,
  //     descriptions: null, specie: null, height: null, weight: null, breeding: null, training: null, abilities: null, typesEffectiveness: null, evolutionChain: null, previousEvolutions: null, superEvolutions: null, baseStats: null, cards: null, soundUrl: null, moves: null, generation: null).obs;


  @override
  void onInit() {
    // TODO: implement onInit
    // getData();
    super.onInit();
  }

  Future<void> getData({String? number}) async {


    final response = await PokemonDetailsApi.getPokemonDetails(number: number);

    print('getting the response from the details api ${response.body}');


    if(response.statusCode == 200){
      pokemonDetailsModels = pokemonDetailsModelsFromJson(response.body);

      update();

    }
    else {
      Get.snackbar('Error', 'Sorry Error Occurred ');
    }

  }



}