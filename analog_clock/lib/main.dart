import 'package:analog_clock/models/my_theme_provider.dart';
import 'package:analog_clock/screens/home_screen.dart';
import 'package:analog_clock/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyThemeModel(),
        child: Consumer<MyThemeModel>(
            builder: (context, theme, child) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Analog Clock',
                  theme: themeData(context),
                  darkTheme: darkThemeData(context),
                  themeMode:
                      theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
                  home: HomeScreen(),
                )));
  }
}

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
