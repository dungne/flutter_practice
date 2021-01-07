import 'package:daily_meditation/constants.dart';
import 'package:daily_meditation/models/session.dart';
import 'package:daily_meditation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * .45,
            decoration: BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/meditation_bg.png'))),
          ),
          SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meditation',
                      style: GoogleFonts.cairo(
                          textStyle: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: kTextColor)),
                    ),
                    SizedBox(
                      width: width * .6,
                      child: Text(
                        '3-10 MIN Course',
                        style: GoogleFonts.cairo(
                            textStyle:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: kTextColor,
                                    )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.6,
                      child: Text(
                        'Live happier and healthier by learnin the fundamentals of meditation and mindfulness',
                        style: GoogleFonts.cairo(
                            textStyle:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kTextColor,
                                    )),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.5,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: kTextColor,
                            ),
                            icon: SvgPicture.asset('assets/icons/search.svg'),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2,
                    physics: ScrollPhysics(),
                    children: [
                      SessionCard(
                        sessionNum: 1,
                        isDone: true,
                      ),
                      SessionCard(sessionNum: 2),
                      SessionCard(sessionNum: 3),
                      SessionCard(sessionNum: 4),
                      SessionCard(sessionNum: 5),
                      SessionCard(sessionNum: 6),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meiditation',
                      style: GoogleFonts.cairo(
                          textStyle: Theme.of(context).textTheme.headline4),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/Meditation_women_small.svg'),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Basic 2',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(fontWeight: FontWeight.w600)),
                              Text(
                                'Start your deepen you practice',
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          SizedBox(width: 10),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SvgPicture.asset('assets/icons/Lock.svg'),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20)
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;

  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 20),
              blurRadius: 23,
              spreadRadius: -13,
              color: kShadowColor)
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          SizedBox(
            width: 43,
            height: 43,
            child: Container(
              decoration: BoxDecoration(
                color: isDone ? kBlueColor : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: kBlueColor),
              ),
              child: Icon(
                Icons.play_arrow,
                color: isDone ? Colors.white : kBlueColor,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Session $sessionNum',
            style: GoogleFonts.cairo(
                textStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
