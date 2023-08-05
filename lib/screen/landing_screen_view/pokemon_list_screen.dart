import 'package:e2_info/controller/getx_bindings/getx_controller_const.dart';
import 'package:flutter/material.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {

  @override
  void initState() {
    // TODO: implement initState

    pokemonListController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
