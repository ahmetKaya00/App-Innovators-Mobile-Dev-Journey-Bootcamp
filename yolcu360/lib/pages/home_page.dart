import 'package:flutter/material.dart';
import 'package:yolcu360/pages/account_page.dart';
import 'package:yolcu360/pages/campaing_page.dart';
import 'package:yolcu360/pages/more_page.dart';
import 'package:yolcu360/pages/search_tab_page.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  int _seletedIndex = 0;

  final List<Widget> _tabs = [
    SearchTab(),
    CampaingPage(),
    AccountPage(),
    MorePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _seletedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _seletedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _seletedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
              label: 'Ara'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer),
              label: 'Kampanyalar'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
              label: 'Hesabım'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
              label: 'Diğer'
            ),
          ]
      ),
    );
  }
}














