import 'package:flutter/material.dart';

class MorePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("Diğer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Hakkımızda'),
              onTap: (){},
            ),ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('İletişim'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('Kullanım Koşulları'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Blog'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Uygulama Bilgileri'),
              onTap: (){},
            ),
            Divider(),
            Padding(padding: const EdgeInsets.all(16),
            child: Text(
              'Sosyal Medya Hesaplarımız',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.facebook, size: 30, color: Colors.blue),
                Icon(Icons.camera_alt, size: 30, color: Colors.purple),
                Icon(Icons.chat, size: 30, color: Colors.lightBlue),
              ],
            )

          ],
        ),
      ),
    );
  }
}