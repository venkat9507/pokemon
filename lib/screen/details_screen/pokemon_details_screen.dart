import 'package:cached_network_image/cached_network_image.dart';
import 'package:e2_info/controller/getx_bindings/getx_controller_const.dart';
import 'package:e2_info/utils/extensions/sizedbox_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/pokemon_details_controller/pokemon_details_controller.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  int? number = 0;

  @override
  void initState() {
    // TODO: implement initState

    number = pokemonDetailsController.number;

    pokemonDetailsController.getData(number: '00$number');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PokemonDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
              pokemonDetailsController.pokemonDetailsModels != null ?
            pokemonDetailsController.pokemonDetailsModels!.name.toString() : 'No Name' ,
            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
          ),
          leading: IconButton(onPressed: (){
            Get.back();
          }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        ),
          body: controller.pokemonDetailsModels != null
              ?
          Container(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        height: 300,
                        width: 300,
                        imageUrl: pokemonDetailsController.pokemonDetailsModels!

                            .imageUrl!,
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  // colorFilter:
                                  // ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                                ),
                              ),
                            ),
                        placeholder: (context,
                            url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                    ListTile(
                      title:  Text(
                        pokemonDetailsController.pokemonDetailsModels!.name.toString().replaceAll('Name.', ''),
                        style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      subtitle:  Text(
                        pokemonDetailsController.pokemonDetailsModels!.descriptions.toString().replaceAll('[', '').replaceAll(']', ''),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    20.ph,
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Types',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.ph,
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 50,
                        width: 70,
                        child:  ListView.separated(
                            separatorBuilder: (context, int index) => 10.ph,
                            itemCount: pokemonDetailsController.pokemonDetailsModels!.types!.length,
                            itemBuilder: (context, int index) {
                              return Text(
                                pokemonDetailsController.pokemonDetailsModels!.types![index].toString(),
                                style: const TextStyle(fontSize: 12,color: Colors.red),
                              );
                            }
                        ),
                      ),
                    ),

                 ListTile(
                  title: const Text(
                  'BaseStats',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HP : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.hp.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'ATTACK : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.attack.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'DEFENSE : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.defense.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'SPATK : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.spAtk.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'SPDEF : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.spDef.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'SPEED : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.speed.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                      10.ph,
                      Text(
                        'TOTAL : ${pokemonDetailsController.pokemonDetailsModels!.baseStats!.total.toString()}',
                        style: const TextStyle(fontSize: 12,color: Colors.red),
                      ),
                    ],
                  ),
                ),
                    20.ph,
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Cards',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                    10.ph,
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        separatorBuilder: (context, int index) => 10.ph,
                        itemCount: pokemonDetailsController.pokemonDetailsModels!.cards!.length,
                        itemBuilder: (context, int index) {
                          return ListTile(
                            title: Text(
                              pokemonDetailsController.pokemonDetailsModels!.cards![index].name.toString().replaceAll('Name.', ''),
                              style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              pokemonDetailsController.pokemonDetailsModels!.cards![index].expansionName.toString(),
                              style: const TextStyle(fontSize: 12,),
                            ), leading: Text(
                              pokemonDetailsController.pokemonDetailsModels!.cards![index].number.toString(),
                              style: const TextStyle(fontSize: 12,color: Colors.red),
                            ),
                            trailing: CachedNetworkImage(
                              height: 30,
                              width: 30,
                              imageUrl:pokemonDetailsController.pokemonDetailsModels!.cards![index]

                                  .imageUrl!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        // colorFilter:
                                        // ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                                      ),
                                    ),
                                  ),
                              placeholder: (context,
                                  url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          );
                        }
                    ),

                  ],
                ),
              ),
            ),
          ) :
          const Center(child: CircularProgressIndicator(color: Colors.red,))

          );
    });
  }
}
