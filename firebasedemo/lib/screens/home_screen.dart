import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/Widget/bottom_nav_bar.dart';
import 'package:firebasedemo/core/locale_manager.dart';
import 'package:firebasedemo/screens/CrudScreen.dart';
import 'package:firebasedemo/screens/login_screen.dart';
import 'package:firebasedemo/screens/profile_screen.dart';
import 'package:firebasedemo/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
 @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('Ana Sayfa', style: TextStyle(fontSize: 24))),
    ProfileScreen(),
    SettingsScreen(),
    CrudScreen(),
  ];

  void _onItemTapped(int index) async{
    if(index == 1){
      final currentUser = FirebaseAuth.instance.currentUser;
      if(currentUser == null){
        final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        if(result == true){
          setState(() {
            _selectedIndex = index;
          });
        }
      }else{
        setState(() {
          _selectedIndex = index;
        });
      }
    }else{
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localManager = Provider.of<LocaleManager>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localManager.translate('title')),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Center(
            child: Text(
              localManager.translate('home'),
              style: TextStyle(fontSize: 24),
            ),
          ),
          ProfileScreen(),
          SettingsScreen(),
          CrudScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
      ),
    );
  }
}