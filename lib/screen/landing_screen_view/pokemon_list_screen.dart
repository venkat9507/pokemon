import 'package:cached_network_image/cached_network_image.dart';
import 'package:e2_info/controller/getx_bindings/getx_controller_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return
          pokemonListController.pokemonsListModels!.isEmpty ?
              const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              ) :
            CustomScrollView(
             slivers: [
               SliverAppBar(
                 floating: false,
                 pinned: true,
                 expandedHeight: 100,
                 stretch: true,
                 backgroundColor: Colors.white,
                 elevation: 10,
                 flexibleSpace: FlexibleSpaceBar(
                   titlePadding: const EdgeInsets.all(12),
                   title:
                       Container(

                         height: 50,
                         width: MediaQuery.of(context).size.width,
                         decoration: BoxDecoration(
                             color: Colors.red,
                           borderRadius: const BorderRadius.all(Radius.circular(12)),
                           border: Border.all(color: Colors.black)
                         ),
                         child: TextButton.icon(onPressed: (){
                           Get.toNamed('/search');
                         },
                             icon: const Icon(Icons.search),
                             label: const Text('search')),
                       ),
                   // background: Image.network('https://htmlcolorcodes.com/assets/images/colors/purple-color-solid-background-1920x1080.png'),
                 ),
               ),
               SliverFillRemaining(
                 child:     ListView.separated(
                     separatorBuilder: (context, int index) => const Divider(),
                     itemCount: pokemonListController.pokemonsListModels!.length,
                     itemBuilder: (context, int index) {
                       return InkWell(
                         onTap: (){
                           pokemonDetailsController.number =
                           int.parse(pokemonListController.pokemonsListModels![index].number);
                           Get.toNamed('pokemon-details');
                         },
                         child: ListTile(
                           leading: SizedBox(
                             width: 70,
                             child:  ListView.separated(
                                 separatorBuilder: (context, int index) => const SizedBox(height: 10,),
                                 itemCount: pokemonListController.pokemonsListModels![index].types.length,
                                 itemBuilder: (context, int index) {
                                   return Text(
                                     pokemonListController.pokemonsListModels![index].types[index].toString(),
                                     style: const TextStyle(fontSize: 12),
                                   );
                                 }
                             ),
                           ),
                           subtitle: Text(
                             pokemonListController.pokemonsListModels![index].name.toString(),
                             style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                             textAlign: TextAlign.center,
                           ),
                           trailing: CachedNetworkImage(
                             height: 100,width: 50,
                             imageUrl: pokemonListController.pokemonsListModels![index].imageUrl,
                             imageBuilder: (context, imageProvider) => Container(
                               decoration: BoxDecoration(
                                 image: DecorationImage(
                                   image: imageProvider,
                                   fit: BoxFit.cover,
                                   // colorFilter:
                                   // ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                                 ),
                               ),
                             ),
                             placeholder: (context, url) => const CircularProgressIndicator(),
                             errorWidget: (context, url, error) => const Icon(Icons.error),
                           ),
                         ),
                       );
                     }
                 ),
               )
             ],
           );
        }));
  }
}
