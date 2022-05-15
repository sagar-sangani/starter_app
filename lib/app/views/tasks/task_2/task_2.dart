import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/widgets/bottom_NavigationBar.dart';

class Task2 extends StatelessWidget {
  const Task2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWColors.slate.shade50,
      bottomNavigationBar: const BNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: TWColors.slate[300],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              'J',
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 18,
                            child: Container(
                              height: 7,
                              width: 7,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: TWColors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      padding: const EdgeInsets.only(right: 20),
                      // color: TWColors.red[300],
                      // width: 260,
                      child: Text(
                        'Jobline',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: ShapeDecoration(
                        color: TWColors.slate.shade100,
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 15,
                            cornerSmoothing: 1.0,
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.notifications_outlined,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            right: 15,
                            bottom: 25,
                            child: Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: TWColors.slate.shade300,
                                ),
                                color: TWColors.red[400],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
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
                          'Search...',
                          style: TextStyle(
                            fontSize: 18,
                            color: TWColors.slate[500],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(BootstrapIcons.sliders, size: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Suggested Jobs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TWColors.black.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.26,
              // color: TWColors.red,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 0.57,
                ),
                scrollDirection: Axis.horizontal,
                children: [
                  JobCard(
                    cardColor:
                        TWColors.white.withRed(32).withGreen(76).withBlue(253),
                    jobRole: 'Product Designer',
                    companyName: 'Ethereum Foundation',
                    textBottonColor:
                        TWColors.white.withRed(45).withGreen(91).withBlue(253),
                    jobLocation: 'India',
                    ctc: '\$195,00',
                  ),
                  JobCard(
                    cardColor: TWColors.black,
                    jobRole: 'UI Designer',
                    companyName: 'Unknown Company',
                    textBottonColor:
                        TWColors.white.withRed(28).withGreen(34).withBlue(42),
                    jobLocation: 'US',
                    ctc: '\$175,00',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Recent Jobs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: TWColors.black.withOpacity(0.5),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            JobListItemCard(
              designation: 'Sr. Product Designer',
              jobLocation: 'Anywhere',
              companyName: 'Uniswap',
              prefix: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color:
                      TWColors.white.withRed(252).withGreen(105).withBlue(132),
                ),
                child: const Icon(
                  BootstrapIcons.alarm,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            JobListItemCard(
              designation: "Digital Designer (NFT)",
              companyName: 'Crypto.com',
              jobLocation: 'Hong Kong',
              prefix: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: TWColors.blue.shade600,
                ),
                child: const Icon(
                  BootstrapIcons.patch_check,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            JobListItemCard(
              designation: 'Maja Avve E',
              companyName: 'Ram Bharose',
              jobLocation: 'Anywhere',
              prefix: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: TWColors.green.shade600,
                ),
                child: const Icon(
                  BootstrapIcons.incognito,
                  size: 20,
                ),
              ),
            )
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
  final Color textBottonColor;
  const JobCard({
    Key? key,
    required this.cardColor,
    required this.jobRole,
    required this.companyName,
    required this.jobLocation,
    required this.ctc,
    required this.textBottonColor,
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
                    color: textBottonColor,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 5,
                        cornerSmoothing: 0.9,
                      ),
                    ),
                  ),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(5),
                  //   color:
                  //       TWColors.white.withRed(45).withGreen(91).withBlue(253),
                  // ),
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
                    color: textBottonColor,
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
                    color: textBottonColor,
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
