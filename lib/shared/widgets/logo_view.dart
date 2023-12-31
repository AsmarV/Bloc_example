
import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: hi(3),
        width: hi(3),
        child: Image.asset('assets/images/logo_bloc.png'));
  }
}
