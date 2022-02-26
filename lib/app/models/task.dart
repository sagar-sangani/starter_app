import 'package:flutter/material.dart';

class Task {
  final String name;
  final Widget widget;
  final Widget page;

  Task({
    required this.name,
    required this.widget,
    required this.page,
  });
}
