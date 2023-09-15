import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tilarna_todo_app/ui/todo_screen.dart';
import 'package:tilarna_todo_app/util/constants.dart';
import 'package:tilarna_todo_app/util/navigator.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  int _code = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: kPad(context) * .1,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: kPad(context) * 0.25),
            child: Text(
              _code.toString(),
              style: style(context).copyWith(
                fontSize: kPad(context) * .1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPad(context) * 0.05),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 1.3),
              itemBuilder: (context, index) {
                return numberButton(
                    context,
                    Text(
                      '${index + 1}',
                      style: style(context).copyWith(
                        fontSize: kPad(context) * 0.05,
                      ),
                    ), () {
                  setState(() {
                    _code = (_code * 10) + (index + 1);
                  });
                });
              }),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPad(context) * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              numberButton(
                  context,
                  Icon(
                    CupertinoIcons.delete_left,
                    size: kPad(context) * .05,
                    color: Colors.red,
                  ), () {
                setState(() {
                  _code = (_code ~/ 10);
                });
              }),
              numberButton(
                  context,
                  Text(
                    '0',
                    style:
                        style(context).copyWith(fontSize: kPad(context) * 0.05),
                  ), () {
                setState(() {
                  _code = (_code * 10) + 0;
                });
              }),
              numberButton(
                  context,
                  Icon(
                    CupertinoIcons.check_mark,
                    size: kPad(context) * .05,
                    color: Colors.green,
                  ), () {
                push(context, const TodoScreen());
              }),
            ],
          ),
        )
      ],
    ));
  }

  IconButton numberButton(
      BuildContext context, Widget icon, void Function() onTap) {
    return IconButton(
        onPressed: onTap,
        iconSize: kPad(context) * .2,
        icon: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: dark.withOpacity(0.1))),
          padding: EdgeInsets.all(kPad(context) * .06),
          child: icon,
        ));
  }
}
