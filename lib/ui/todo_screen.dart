import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tilarna_todo_app/bloc/todo/todo_bloc.dart';
import 'package:tilarna_todo_app/ui/add_todo_screen.dart';
import 'package:tilarna_todo_app/ui/widgets/custom_app_bar.dart';
import 'package:tilarna_todo_app/ui/widgets/fullScreenBottomSheet.dart';
import 'package:tilarna_todo_app/util/constants.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: kPad(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kPad(context) * 0.2,
                ),
                Text(
                  'ToDo Screen',
                  style: style(context),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: customAppBar(context, 'All Tasks', CupertinoIcons.left_chevron,
              Iconsax.add, () {}, () {
            fullScreenBottomSheet(context, AddTodoScreen());
          }),
        ),
      ],
    ));
  }
}
