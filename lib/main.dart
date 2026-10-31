import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:june26_provider/controllers/colorcontroller.dart';
import 'package:june26_provider/controllers/count_controller.dart';
import 'package:june26_provider/controllers/product_controller.dart';
import 'package:june26_provider/views/colorview.dart';
import 'package:june26_provider/views/productView.dart';


import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CountController>(create: (_) => CountController()),
          ChangeNotifierProvider<Colorcontroller>(create: (_) => Colorcontroller()),
          ChangeNotifierProvider<ProductController>(create: (_) => ProductController()),
          //ChangeNotifierProvider<ProductController>(create: (_) => ProductController()..fetch()),
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Productview(),
    );
  }
}
