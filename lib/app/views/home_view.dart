import 'package:flutter/material.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo.dart';
import 'package:starter_app/app/views/tasks/daglo/daglo_page.dart';
import 'package:starter_app/app/views/tasks/mytask/mytask.dart';
import 'package:starter_app/app/views/tasks/mytask/mytask_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> tasks = [
      {
        "name": "Daglo",
        "widget": Daglo(),
        "page": DagloPage(),
      },
      {
        "name": "This is my task",
        "widget": MyTask(),
        "page": MyTaskPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            ...tasks
                .map(
                  (e) => GridItem(
                      serialNumber: tasks.indexOf(e) + 1,
                      name: e['name'],
                      widget: e['widget'],
                      page: e['page']),
                )
                .toList(),
          ],
        ),
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
      child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.7),
                child: Text(
                  '${serialNumber}. ${name}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
