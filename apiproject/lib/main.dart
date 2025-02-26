

import 'package:apiproject/providers/cart_provider.dart';
import 'package:apiproject/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Ticaret',
      home: ProductListScreen(),
    );
  }
}