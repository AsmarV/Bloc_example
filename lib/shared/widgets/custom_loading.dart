import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../app.dart';


class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWi(),
      height: double.infinity,
      color: blackC.withOpacity(0.5),
      padding: EdgeInsets.all(sized16()*2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: hi(2),
              width: hi(2),
              child: Image.asset('assets/images/logo_without.png')),
          SizedBox(
            width: fullWi()/3,
            child: const  LinearProgressIndicator(
              backgroundColor: shadePrimeColor,
            ),
          ),
        ],
      ),
    );
  }
}
