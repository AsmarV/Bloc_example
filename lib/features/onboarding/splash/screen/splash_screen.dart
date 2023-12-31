import 'package:bloc_example/features/onboarding/splash/bloc/splash_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/logo_view.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_states.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var bloc = SplashBloc();
    bloc.add(InitSplashEvent());

    ///BUILD BLOC
    return BlocBuilder<SplashBloc,SplashState>(
      builder: _buildSplashView,
    );
  }

  ///UI SCREEN
  Widget _buildSplashView(context, state) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoView(),
            SizedBox(
              width: fullWi(),
            ),
            Text(
              title,
              style:
                  TextStyle(fontSize: font(0.3), fontWeight: FontWeight.w200),
            )
          ],
        ),
      );
}
