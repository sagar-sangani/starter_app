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
import 'package:starter_app/app/views/tasks/task_2/task_2_page.dart';
import 'package:starter_app/app/views/tasks/task_3/task_3_page.dart';
import 'package:starter_app/app/views/tasks/task_4/task_4_page.dart';
import 'package:starter_app/app/views/tasks/triangle/triangle.dart';
import 'package:starter_app/app/views/tasks/triangle/triangle_page.dart';

List<Task> TASK_LIST = [
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
  Task(
    name: 'Task 2 Screen',
    widget: Container(),
    page: const Task2Page(),
  ),
  Task(
    name: 'Task 3 Screen',
    widget: Container(),
    page: const Task3Page(),
  ),
  Task(
    name: 'Task 4 Screen',
    widget: Container(),
    page: const Task4Page(),
  ),
];
