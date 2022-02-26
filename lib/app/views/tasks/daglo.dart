import 'package:flutter/material.dart';

class Daglo extends StatelessWidget {
  const Daglo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            height: 200,
            width: 200,
            color: Colors.pink[100],
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    bottom: 30,
                  ),
                  height: 60,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.deepOrange,
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(
                          left: 20,
                        ),
                      ),
                      Container(
                        color: Colors.deepOrange,
                        height: 60,
                        width: 60,
                        margin: EdgeInsets.only(
                          right: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  height: 30,
                  width: 100,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.brown,
            height: 150,
            width: 45,
          ),
          Container(
            color: Colors.lightGreen,
            height: 50,
            width: 250,
          ),
          Container(
            height: 200,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 200,
                  width: 30,
                  color: Colors.amberAccent,
                ),
                Container(
                  height: 200,
                  width: 30,
                  color: Colors.amberAccent,
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 50,
                  ),
                  height: 30,
                  width: 60,
                  color: Colors.pink,
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 19,
                  ),
                  height: 30,
                  width: 60,
                  color: Colors.pink,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
