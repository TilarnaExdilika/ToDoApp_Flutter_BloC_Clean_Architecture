import 'package:flutter/material.dart';
import 'package:tilarna_todo_app/util/constants.dart';

Widget customAppBar(
    BuildContext context,
    String title,
    IconData firstIcon,
    IconData secondIcon,
    void Function() firstIconFunction,
    void Function() secondIconFuntion) {
  return Container(
    //
    height: kPad(context) * .25,
    width: kPad(context),
    decoration: const BoxDecoration(),
    child: Center(
      child: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: firstIconFunction,
              icon: Icon(
                firstIcon,
                color: dark.withOpacity(.5),
              )),
          Text(
            title,
            style: style(context).copyWith(
              fontSize: kPad(context) * .04,
              fontWeight: FontWeight.w400,
            ),
          ),
          IconButton(
              onPressed: secondIconFuntion,
              icon: Icon(
                secondIcon,
                color: dark.withOpacity(.5),
              )),
        ],
      )),
    ),
  );
}
