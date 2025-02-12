import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 100,
              height: 50,
              child: Center(
                child: Text(
                  "1. Satır",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              width: 100,
              height: 50,
              child: Center(
                child: Text(
                  "2. Satır",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              width: 100,
              height: 50,
              child: Center(
                child: Text(
                  "3. Satır",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}