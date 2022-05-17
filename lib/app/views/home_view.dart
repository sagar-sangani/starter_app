import 'package:flutter/material.dart';
import 'package:starter_app/app/theme/tw_colors.dart';
import 'package:starter_app/app/views/tasks_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        backgroundColor: TWColors.blue[400],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ...TASK_LIST
              .map(
                (e) => GridItem(
                  key: ValueKey(e.name),
                  serialNumber: TASK_LIST.indexOf(e) + 1,
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
