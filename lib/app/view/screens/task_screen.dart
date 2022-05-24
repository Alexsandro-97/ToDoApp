import 'package:app_todo/app/view/colors/colors.dart';
import 'package:app_todo/app/view/widgets/badger_widget.dart';
import 'package:app_todo/app/view/widgets/content_widget.dart';
import 'package:app_todo/app/view/widgets/input_widget.dart';
import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorScaffold,
      appBar: AppBar(
        title: Row(children: const [
          Text(
            'My Tasks',
            style: TextStyle(
              color: Color(0xFF494655),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          BadgerCustom(color: AppColors.badgerColor, size: 15),
        ]),
        backgroundColor: AppColors.backgroundColorAppBar,
        elevation: 0,
      ),
      body: Column(
        children: const [Expanded(child: ContentWidget())],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet<void>(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                  padding: const EdgeInsets.all(20),
                  height: 261,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: const InputWidget());
            },
          );
        },
      ),
    );
  }
}
