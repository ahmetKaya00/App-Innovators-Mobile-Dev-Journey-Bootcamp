import 'package:flutter/material.dart';
import 'package:yolcu360/pages/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Yolcu360 Uygulaması',
     home: HomeScreen(),
   );
  }
}