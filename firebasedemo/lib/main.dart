import 'package:firebasedemo/core/locale_manager.dart';
import 'package:firebasedemo/core/theme_manager.dart';
import 'package:firebasedemo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeManager()),
          ChangeNotifierProvider(create: (_) => LocaleManager()),
        ],
      child: Consumer2<ThemeManager,LocaleManager>(
        builder: (context, themeManager,localeManager,child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: (localeManager.translate('title')),
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeManager.themeMode,
            locale: localeManager.currentLocale,
            localizationsDelegates: const[
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const[
              Locale('en'),
              Locale('tr'),
            ],
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}