import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/getx_bindings/getx_controller_const.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController searchController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
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
                      height: 35,
                      margin: const EdgeInsets.all(3),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2,right: 2),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            pokemonListController.searchCat(value);
                          },
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            // contentPadding: EdgeInsets.only(top: 20),
                            isDense: true,
                            hintText: "Search",
                            suffixIcon: Icon(
                              Icons.search_outlined, color: Colors.grey.shade300,),
                          ),
                        ),
                      ),
                    ),
                    // background: Image.network('https://htmlcolorcodes.com/assets/images/colors/purple-color-solid-background-1920x1080.png'),
                  ),
                ),
                SliverFillRemaining(
                  child:
                  pokemonListController.filteredPokemonListModels!.isEmpty ?
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ) :
                  ListView.separated(
                      separatorBuilder: (context, int index) => const Divider(),
                      itemCount: pokemonListController.filteredPokemonListModels!.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          leading: Text(
                            pokemonListController.filteredPokemonListModels![index].name.toString(),
                            style: const TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          trailing: SizedBox(
                            height: 100,
                            width: 50,
                            child: CachedNetworkImage(
                              imageUrl: pokemonListController.filteredPokemonListModels![index].imageUrl,
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
