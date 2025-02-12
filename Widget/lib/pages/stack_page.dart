import 'package:flutter/material.dart';

class StackPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              color: Colors.blue,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),
            Text(
              "Stack Widget",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}