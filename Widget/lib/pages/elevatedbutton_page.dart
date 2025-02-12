import 'package:flutter/material.dart';

class ElevatedButtonPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ElevatedButton Widget"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Basit butona tıklandı!"))
                  );
                },
                child: Text("Basit Button"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Stilli Butona Tıklandı!"))
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                    elevation: 10,
                ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Stilli Button",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewPage()),
                  );
                },
                child: Text("Yeni Sayfaya Git!"),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Sayfa"),
      ),
      body: Center(
        child: Text("Bu yeni bir sayfa!",
        style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}