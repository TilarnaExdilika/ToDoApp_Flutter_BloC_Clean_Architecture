import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:tilarna_todo_app/util/constants.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  int animationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: kPad(context) * .05),
          child: Text(
            'Add a task',
            style: style(context).copyWith(
                fontWeight: FontWeight.w400, fontSize: kPad(context) * .04),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kPad(context) * .05, vertical: kPad(context) * .1),
          child: Row(
            children: [
              Container(
                height: kPad(context) * .35,
                width: kPad(context) * .35,
                decoration: BoxDecoration(
                    color: blue.withOpacity(.1),
                    borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.all(kPad(context) * .05),
                child: animationIndex == 0
                    ? Icon(
                        Iconsax.add,
                        size: kPad(context) * .07,
                        color: blue,
                      )
                    : Lottie.asset('assets/$animationIndex.json'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
