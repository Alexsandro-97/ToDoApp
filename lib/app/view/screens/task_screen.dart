import 'package:app_todo/app/view/colors/colors.dart';
import 'package:app_todo/app/view/widgets/badger_widget.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorScaffold,
      appBar: AppBar(
        title: Row(children: const [
          Text('My Tasks'),
          SizedBox(width: 5),
          BadgerCustom(color: AppColors.badgerColor, size: 15),
        ]),
        backgroundColor: AppColors.backgroundColorAppBar,
        elevation: 0,
      ),
      body: const Center(child: Text('TaskScreen')),
    );
  }
}
