import 'package:daily_meditation/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * .1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              title: 'Today',
              svgSrc: 'assets/icons/calendar.svg',
              onTap: () {
                print('on tap');
              },
            ),
            BottomNavItem(
              title: 'All Exercises',
              svgSrc: 'assets/icons/gym.svg',
              onTap: () {
                print('on tap');
              },
              isActive: true,
            ),
            BottomNavItem(
              title: 'Settings',
              svgSrc: 'assets/icons/Settings.svg',
              onTap: () {
                print('on tap');
              },
            ),
          ],
        ),
      ),
    );
  }
}
