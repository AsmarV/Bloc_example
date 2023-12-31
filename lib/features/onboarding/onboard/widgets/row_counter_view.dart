
import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../../core/utils/responsive.dart';
import '../bloc/onboard_states.dart';

class RowCounterUI extends StatelessWidget {
  const RowCounterUI({super.key, required this.state});
  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: SizedBox(
        width: fullWi(),
        height: fullHi() * 0.2,
        child: Column(
          children: [
            Icon(
              Icons.swipe,
              color: shadeSecondaryColor,
              size: font(1),
            ),
            SizedBox(
              height: sized16(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: state.pages
                  .map<Widget>((e) => Container(
                height: sized16(),
                width: sized16(),
                margin: EdgeInsets.all(sized16() / 2),
                decoration: BoxDecoration(
                    color: e['id'] == state.currentPage
                        ? primeColor
                        : shadePrimeColor,
                    shape: BoxShape.circle),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
