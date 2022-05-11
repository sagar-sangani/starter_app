import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';

class Task1 extends StatelessWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TWColors.slate[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20),
              child: Container(
                // color: TWColors.slate[300],
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'SKIP',
                    style: TextStyle(fontSize: 16, color: TWColors.slate),
                  ),
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  width: double.infinity,
                  child: Center(
                    child: Image.network(
                        "https://www.uniquenewsonline.com/wp-content/uploads/2020/08/allu-arjun-image-7-300x300.jpg"),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 20,
                  child: Container(
                    height: 55,
                    width: 175,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: TWColors.white,
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 0,
                          fit: FlexFit.tight,
                          child: Container(
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: TWColors.fuchsia,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const SizedBox(height: 2),
                              Container(
                                child: const Text(
                                  'UI/UX Designer',
                                  maxLines: 1,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 10.0),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                child: const Text(
                                  'Uniswap',
                                  maxLines: 1,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          fit: FlexFit.tight,
                          child: GestureDetector(
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: TWColors.blue.shade700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -8,
                  right: 10,
                  child: Container(
                    width: 180,
                    height: 150,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: TWColors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Flexible(
                                flex: 0,
                                fit: FlexFit.tight,
                                child: Text(
                                  '50K+',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                fit: FlexFit.tight,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Positioned(
                                      right: 0,
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: TWColors.blue,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 16,
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: TWColors.black,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 32,
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: TWColors.green,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 48,
                                      child: Container(
                                        height: 23,
                                        width: 23,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: TWColors.yellow,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: 10,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.black,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.blue,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.black,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.blue,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.black,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.blue,
                                ),
                              ),
                              Container(
                                width: 10,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: TWColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: Text(
                            'The leading Companies',
                            style: TextStyle(
                                color: TWColors.slate[700], fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Text(
                'The leading job board for Blockchian jobs',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, top: 20, bottom: 0),
              child: Text(
                'Curates the best new blockchain jobs at leading companies that use blockchain technology',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: TWColors.neutral[500],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: TWColors.blue,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 20,
                    color: TWColors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: TWColors.slate[300]),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    height: 8,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: TWColors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: TWColors.slate[300]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
