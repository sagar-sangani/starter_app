import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

class Task3 extends StatelessWidget {
  const Task3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWColors.slate.shade50,
      bottomNavigationBar: const BNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              // color: TWColors.slate.shade300,
              height: 30,
              child: Row(
                children: const [
                  Icon(BootstrapIcons.arrow_left),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 35,
              ),
              child: Container(
                height: 60,
                decoration: ShapeDecoration(
                  color: TWColors.slate.shade100,
                  shape: SmoothRectangleBorder(
                    borderRadius: SmoothBorderRadius(
                      cornerRadius: 15,
                      cornerSmoothing: 0.6,
                    ),
                    side: BorderSide(
                      width: 1,
                      color: TWColors.slate.withOpacity(0.4),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(Icons.search, size: 30),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          'Design',
                          style: TextStyle(
                              fontSize: 18,
                              color: TWColors.slate[800],
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          child: const Icon(BootstrapIcons.x, size: 22),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: TWColors.slate.shade300.withOpacity(0.7)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Color cardColor;
  final String jobRole;
  final String companyName;
  final String jobLocation;
  final String ctc;

  const JobCard({
    Key? key,
    required this.cardColor,
    required this.jobRole,
    required this.companyName,
    required this.jobLocation,
    required this.ctc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: cardColor,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 20,
            cornerSmoothing: 1.0,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Flexible(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: const Icon(BootstrapIcons.activity),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:
                        TWColors.white.withRed(46).withGreen(94).withBlue(254),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobRole,
                        style: TextStyle(
                            fontSize: 16, color: TWColors.slate.shade50),
                      ),
                      Text(
                        companyName,
                        style: TextStyle(
                            fontSize: 10, color: TWColors.slate.shade300),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: const Icon(
                    BootstrapIcons.bookmark,
                    size: 15,
                    color: TWColors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Center(
                    child: Text(
                      'Design',
                      style: TextStyle(
                          fontSize: 10, color: TWColors.slate.shade300),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: TWColors.white.withOpacity(0.1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 5,
                        cornerSmoothing: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                fit: FlexFit.tight,
                flex: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Full Time',
                    style:
                        TextStyle(fontSize: 10, color: TWColors.slate.shade300),
                  ),
                  decoration: ShapeDecoration(
                    color: TWColors.white.withOpacity(0.1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 5,
                        cornerSmoothing: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                flex: 0,
                fit: FlexFit.tight,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Center(
                    child: Text(
                      'Anywhere',
                      style: TextStyle(
                          fontSize: 10, color: TWColors.slate.shade300),
                    ),
                  ),
                  decoration: ShapeDecoration(
                    color: TWColors.white.withOpacity(0.1),
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 5,
                        cornerSmoothing: 0.9,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(BootstrapIcons.geo_alt,
                      size: 14, color: TWColors.slate.shade100),
                  const SizedBox(width: 5),
                  Text(
                    jobLocation,
                    style:
                        TextStyle(color: TWColors.slate.shade300, fontSize: 12),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: ctc,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '/year',
                      style: TextStyle(
                          color: TWColors.slate.shade300, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BNavigationBar extends StatelessWidget {
  const BNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        height: kBottomNavigationBarHeight,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: const [
                Icon(Icons.home, color: Colors.blue),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 13,
                    color: TWColors.blue,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Icon(Icons.bookmark_outline_outlined),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Saved',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Icon(Icons.message_outlined),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Message',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
            Column(
              children: const [
                Icon(Icons.person_outline),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
