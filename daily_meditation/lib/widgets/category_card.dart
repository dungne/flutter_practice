import 'package:daily_meditation/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String svgSrc;
  final Function onTap;
  const CategoryCard({
    Key key,
    this.title,
    this.svgSrc,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -15,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontSize: 15)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
