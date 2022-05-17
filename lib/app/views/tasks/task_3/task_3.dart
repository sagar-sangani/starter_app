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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    BootstrapIcons.arrow_left,
                    size: 20,
                    color: TWColors.black,
                  ),
                  Text(
                    'Browse Jobs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Icon(BootstrapIcons.sliders, size: 18),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 25,
              ),
              child: Container(
                height: 60,
                decoration: ShapeDecoration(
                  color: TWColors.slate.shade50,
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.search,
                            size: 30, color: TWColors.black.withOpacity(0.7)),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          'Design',
                          style: TextStyle(
                              fontSize: 18,
                              color: TWColors.slate[800],
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: const Icon(BootstrapIcons.x, size: 22),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: TWColors.slate.shade100),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    JobDetailsSliderButton(
                      title: Text(
                        'Jobs',
                        style: TextStyle(
                            color: TWColors.slate.shade50,
                            fontWeight: FontWeight.w700),
                      ),
                      backgroundColor: TWColors.black,
                    ),
                    JobDetailsSliderButton(
                      title: Text(
                        'Companies',
                        style: TextStyle(
                            color: TWColors.slate.shade500,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ),
                    JobDetailsSliderButton(
                      title: Text(
                        'Salaries',
                        style: TextStyle(
                            color: TWColors.slate.shade500,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              // color: TWColors.blue.shade100,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: const Text(
                '45 Blockchain Jobs',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                // color: TWColors.blue,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      JobCard(
                        cardColor: TWColors.slate.shade100,
                        companyIcon: Icon(
                          BootstrapIcons.sliders,
                          color: TWColors.slate.shade50,
                        ),
                        companyIconBackgrounColor: TWColors.white
                            .withRed(46)
                            .withGreen(94)
                            .withBlue(254),
                        bookmarkIcon: const Icon(
                          BootstrapIcons.bookmark,
                          size: 17,
                          color: TWColors.slate,
                        ),
                        jobRole: const Text(
                          'Jr. Game Designer',
                          style: TextStyle(
                              fontSize: 19,
                              color: TWColors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        companyName: const Text(
                          'Axie Infinity',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        department: const Text(
                          'Design',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        typeOfJob: const Text(
                          'Full Time',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        jobLocation: const Text(
                          'Ho Chi Minh City',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        ctc: '\$180,000',
                        ctcTextStyle: const TextStyle(
                            color: TWColors.black, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),
                      JobCard(
                        cardColor: TWColors.slate.shade100,
                        companyIcon: Icon(
                          BootstrapIcons.sliders,
                          color: TWColors.slate.shade50,
                        ),
                        companyIconBackgrounColor: TWColors.white
                            .withRed(5)
                            .withGreen(27)
                            .withBlue(78),
                        bookmarkIcon: const Icon(
                          BootstrapIcons.bookmark_fill,
                          size: 17,
                          color: TWColors.blue,
                        ),
                        jobRole: const Text(
                          'Digital Disigner (NFT)',
                          style: TextStyle(
                              fontSize: 19,
                              color: TWColors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        companyName: const Text(
                          'Crypto.com',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        department: const Text(
                          'Design',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        typeOfJob: const Text(
                          'Full Time',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        jobLocation: const Text(
                          'Hong Kong',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        ctc: '\$210,000',
                        ctcTextStyle: const TextStyle(
                            color: TWColors.black, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 20),
                      JobCard(
                        cardColor: TWColors.slate.shade100,
                        companyIcon: Icon(
                          BootstrapIcons.sliders,
                          color: TWColors.slate.shade50,
                        ),
                        companyIconBackgrounColor: TWColors.white
                            .withRed(253)
                            .withGreen(104)
                            .withBlue(132),
                        bookmarkIcon: const Icon(
                          BootstrapIcons.bookmark,
                          size: 17,
                          color: TWColors.slate,
                        ),
                        jobRole: const Text(
                          'Digital Disigner (NFT)',
                          style: TextStyle(
                              fontSize: 19,
                              color: TWColors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        companyName: const Text(
                          'Axie Infinity',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        department: const Text(
                          'Design',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        typeOfJob: const Text(
                          'Full Time',
                          style: TextStyle(color: TWColors.slate),
                        ),
                        jobLocation: const Text('Ho Chi Minh City',
                            style: TextStyle(color: TWColors.slate)),
                        ctc: '\$180,000',
                        ctcTextStyle: const TextStyle(
                            color: TWColors.black, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class JobDetailsSliderButton extends StatelessWidget {
  final Text title;
  Color? backgroundColor;
  JobDetailsSliderButton({
    Key? key,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 15,
        right: 15,
      ),
      child: title,
      decoration: ShapeDecoration(
        color: backgroundColor ?? TWColors.slate.shade50,
        shape: SmoothRectangleBorder(
          side: BorderSide(
            color: TWColors.slate.withOpacity(0.3),
          ),
          borderRadius: SmoothBorderRadius(
            cornerRadius: 8,
            cornerSmoothing: 1.0,
          ),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Color cardColor;
  final Icon companyIcon;
  final Color companyIconBackgrounColor;
  final Icon bookmarkIcon;
  final Text jobRole;
  final Text companyName;
  final Text department;
  final Text typeOfJob;
  final Text jobLocation;
  final String ctc;
  final TextStyle ctcTextStyle;

  const JobCard({
    Key? key,
    required this.cardColor,
    required this.companyIcon,
    required this.companyIconBackgrounColor,
    required this.bookmarkIcon,
    required this.jobRole,
    required this.companyName,
    required this.department,
    required this.typeOfJob,
    required this.jobLocation,
    required this.ctc,
    required this.ctcTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.only(top: 20, bottom: 20),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IntrinsicHeight(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Flexible(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: companyIcon,
                      decoration: ShapeDecoration(
                        color: companyIconBackgrounColor,
                        shape: SmoothRectangleBorder(
                          borderRadius: SmoothBorderRadius(
                            cornerRadius: 8,
                            cornerSmoothing: 0.9,
                          ),
                        ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          jobRole,
                          companyName,
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, bottom: 10),
                      child: bookmarkIcon,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: department,
                    ),
                    decoration: ShapeDecoration(
                      color: TWColors.white.withOpacity(0.1),
                      shape: SmoothRectangleBorder(
                        side: BorderSide(color: TWColors.slate.shade300),
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 5,
                          cornerSmoothing: 0.9,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: typeOfJob,
                    decoration: ShapeDecoration(
                      color: TWColors.white.withOpacity(0.1),
                      shape: SmoothRectangleBorder(
                        side: BorderSide(color: TWColors.slate.shade300),
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 5,
                          cornerSmoothing: 0.9,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: jobLocation,
                    ),
                    decoration: ShapeDecoration(
                      color: TWColors.white.withOpacity(0.1),
                      shape: SmoothRectangleBorder(
                        side: BorderSide(color: TWColors.slate.shade300),
                        borderRadius: SmoothBorderRadius(
                          cornerRadius: 5,
                          cornerSmoothing: 0.9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(BootstrapIcons.geo_alt,
                        size: 14, color: TWColors.slate.shade800),
                    const SizedBox(width: 5),
                    jobLocation,
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ctc,
                        style: ctcTextStyle,
                      ),
                      const TextSpan(
                        text: '/year',
                        style: TextStyle(color: TWColors.slate, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
