
import 'dart:convert';

import 'package:e2_info/controller/getx_bindings/getx_controller_const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PokemonListApi {
  static Future getPokemonList() async {

    try {
      final Uri url = Uri.parse('https://pokedex.alansantos.dev/api/pokemons.json');
      final response = await http.get(url);


      // print('getting the response from the api ${response.statusCode}');

      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        debugPrint('checking the pokemon list api $jsonData');

        return response;
      }

    } catch (error){
      return error;
    }

  }
}