import 'package:flutter/material.dart';

class Daglo extends StatelessWidget {
  const Daglo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double size = constraints.maxHeight * 0.0012;

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50 * size),
              height: 200 * size,
              width: 200 * size,
              color: Colors.pink[100],
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 40 * size,
                      bottom: 30 * size,
                    ),
                    height: 60 * size,
                    width: 200 * size,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.deepOrange,
                          height: 60 * size,
                          width: 60 * size,
                          margin: EdgeInsets.only(
                            left: 20 * size,
                          ),
                        ),
                        Container(
                          color: Colors.deepOrange,
                          height: 60 * size,
                          width: 60 * size,
                          margin: EdgeInsets.only(
                            right: 20 * size,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10 * size,
                    ),
                    height: 30 * size,
                    width: 100 * size,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.brown,
              height: 150 * size,
              width: 45 * size,
            ),
            Container(
              color: Colors.lightGreen,
              height: 50 * size,
              width: 250 * size,
            ),
            Container(
              height: 200 * size,
              width: 200 * size,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200 * size,
                    width: 30 * size,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    height: 200 * size,
                    width: 30 * size,
                    color: Colors.amberAccent,
                  ),
                ],
              ),
            ),
            Container(
              height: 50 * size,
              width: 300 * size,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 50 * size,
                    ),
                    height: 30 * size,
                    width: 60 * size,
                    color: Colors.pink,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: 19 * size,
                    ),
                    height: 30 * size,
                    width: 60 * size,
                    color: Colors.pink,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
