import 'package:flutter/material.dart';
import 'package:starter_app/app/models/task.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks/abcd/abcd.dart';
import 'package:starter_app/app/views/tasks/abcd/abcd_page.dart';
import 'package:starter_app/app/views/tasks/chitrakala/chitrakala.dart';
import 'package:starter_app/app/views/tasks/chitrakala/chitrakala_page.dart';
import 'package:starter_app/app/views/tasks/circle/circle.dart';
import 'package:starter_app/app/views/tasks/circle/circle_page.dart';
import 'package:starter_app/app/views/tasks/colour_shadding/color_shadding.dart';
import 'package:starter_app/app/views/tasks/colour_shadding/color_shadding_page.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo_page.dart';
import 'package:starter_app/app/views/tasks/family_tree/family_tree.dart';
import 'package:starter_app/app/views/tasks/family_tree/family_tree_page.dart';
import 'package:starter_app/app/views/tasks/hexagon/hexagon.dart';
import 'package:starter_app/app/views/tasks/hexagon/hexagon_page.dart';
import 'package:starter_app/app/views/tasks/login/login_page.dart';
import 'package:starter_app/app/views/tasks/pentagon/pentagon.dart';
import 'package:starter_app/app/views/tasks/pentagon/pentagon_page.dart';
import 'package:starter_app/app/views/tasks/polygon/polygon.dart';
import 'package:starter_app/app/views/tasks/polygon/polygon_page.dart';
import 'package:starter_app/app/views/tasks/task_1/task_1_page.dart';
import 'package:starter_app/app/views/tasks/triangle/triangle.dart';
import 'package:starter_app/app/views/tasks/triangle/triangle_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = [
      Task(
        name: "Daglo",
        widget: const Daglo(),
        page: const DagloPage(),
      ),
      Task(
        name: "This is my Painting",
        widget: const Chitrakala(),
        page: const ChitrakalaPage(),
      ),
      Task(
        name: 'Abcd',
        widget: const Abcd(showButton: false),
        page: const AbcdPage(),
      ),
      Task(
        name: 'Polygon',
        widget: const Polygon(),
        page: const PolygonPage(),
      ),
      Task(
        name: 'Hexagon',
        widget: const Hexagon(),
        page: const HexagonPage(),
      ),
      Task(
        name: 'Triangle',
        widget: const Triangle(),
        page: const TrianglePage(),
      ),
      Task(
        name: 'Pentagon',
        widget: const Pentagon(),
        page: const PentagonPage(),
      ),
      Task(
        name: 'Color Shaddings',
        widget: const ColorShadding(),
        page: const ColorShaddingPage(),
      ),
      Task(
        name: 'Login Screen',
        widget: Container(
          color: TWColors.slate[100],
          child: const Center(
            child: Text(
              'Login Screen',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        page: const LoginPage(),
      ),
      Task(
        name: 'Family Tree',
        widget: const FamilyTree(),
        page: const FamilyTreePage(),
      ),
      Task(
        name: 'Circle',
        widget: const Circle(),
        page: const CirclePage(),
      ),
      Task(
        name: 'Task 1 Screen',
        widget: Container(),
        page: const Task1Page(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        backgroundColor: TWColors.blue[400],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...tasks
              .map(
                (e) => GridItem(
                  serialNumber: tasks.indexOf(e) + 1,
                  name: e.name,
                  widget: e.widget,
                  page: e.page,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final int serialNumber;
  final String name;
  final Widget widget;
  final Widget page;
  const GridItem({
    Key? key,
    required this.serialNumber,
    required this.name,
    required this.widget,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          widget,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black.withOpacity(0.7),
              child: Text(
                '$serialNumber. $name',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
