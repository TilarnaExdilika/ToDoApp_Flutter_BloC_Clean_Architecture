import 'package:flutter/material.dart';

push(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

replace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

pop(context) {
  Navigator.pop(context);
}

popUntilFirstPage(context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}
