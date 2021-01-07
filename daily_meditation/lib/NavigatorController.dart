import 'package:daily_meditation/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class NavigatorController {
  static goToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(),
      ),
    );
  }
}
