import 'package:flutter/material.dart';
import 'package:widget/pages/column_page.dart';
import 'package:widget/pages/container_page.dart';
import 'package:widget/pages/elevatedbutton_page.dart';
import 'package:widget/pages/grid_view_page.dart';
import 'package:widget/pages/listview_page.dart';
import 'package:widget/pages/row_pages.dart';
import 'package:widget/pages/stack_page.dart';
import 'package:widget/pages/text_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Exproler'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Row Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RowPage()),
              );
            },
          ),
          ListTile(
            title: Text('Column Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColumnPage()),
              );
            },
          ),
          ListTile(
            title: Text('Container Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContainerPage()),
              );
            },
          ),
          ListTile(
            title: Text('Text Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TextPage()),
              );
            },
          ),
          ListTile(
            title: Text('ListView Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewPage()),
              );
            },
          ),
          ListTile(
            title: Text('ElevatedButton Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ElevatedButtonPage()),
              );
            },
          ),
          ListTile(
            title: Text('Stack Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StackPage()),
              );
            },
          ),
          ListTile(
            title: Text('Grid View Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GridViewPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}