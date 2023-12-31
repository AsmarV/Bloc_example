
import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../../core/utils/responsive.dart';
import '../bloc/onboard_states.dart';

class PageViewUI extends StatelessWidget {
  const PageViewUI({super.key, required this.state});
  final OnboardState state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sized16() / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: hi(2.5),
              width: double.infinity,
              child: Image.asset(state.pages[state.currentPage]['img'])),
          SizedBox(
            height: sized16(),
          ),
          Text(
            state.pages[state.currentPage]['title'],
            style: TextStyle(fontSize: font(0.5), color: primeColor),
          ),
          SizedBox(
            height: sized16() / 2,
          ),
          Text(
            state.pages[state.currentPage]['description'],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: font(0.3), color: primeColor),
          ),
        ],
      ),
    );
  }
}
