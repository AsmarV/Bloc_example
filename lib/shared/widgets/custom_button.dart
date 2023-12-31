import 'package:flutter/material.dart';

import '../../app.dart';
import '../../core/utils/responsive.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.color = primeColor});

  final String title;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shadowColor: MaterialStateProperty.all(Colors.grey.shade200),
            overlayColor: MaterialStateProperty.all(blackC.withOpacity(0.1)),
            backgroundColor: MaterialStateProperty.all(color),
            fixedSize:
                MaterialStateProperty.all(Size(double.infinity, hi(0.65))),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sized16() / 2)))),
        onPressed: onPressed ?? () {},
        child: Text(
          title,
          style: TextStyle(fontSize: font(0.4), color: Colors.white),
        ));
  }
}
