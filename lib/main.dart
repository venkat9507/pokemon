import 'package:e2_info/controller/getx_bindings/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/landing_screen_view/pokemon_list_screen.dart';
import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBindings(),
      title: 'Pokemon',
      getPages: Routes.routes,
      // home: const PokemonListScreen(),
      initialRoute: '/',
    );
  }
}


