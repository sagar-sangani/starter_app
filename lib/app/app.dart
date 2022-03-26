
import 'package:flutter/material.dart';
import 'package:starter_app/app/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sagar Sangani",
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
