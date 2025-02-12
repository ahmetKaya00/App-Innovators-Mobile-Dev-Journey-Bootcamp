import 'package:flutter/material.dart';

class TextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Basit bir metin örneği"),

            SizedBox(height: 10),
            Text(
              "Kalın, büyük ve renkli bir metin",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Bu, taşan bir metin örneğidir. Çok uzun bir metin göstermek "
                  "ve taşma durumlarında nasıl davranılacağını kontrol etmek için",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Altı çizgili ve italik bir metin",
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            )
          ],
        ),
      ),
    );
  }
}