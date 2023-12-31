import 'dart:async';

import 'package:bloc_example/features/auth/login/screen/login_screen.dart';
import 'package:bloc_example/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../app.dart';
import '../../onboard/screen/on_board_screen.dart';
import 'splash_events.dart';
import 'splash_states.dart';

class SplashBloc extends Bloc<SplashBlocEvents, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<InitSplashEvent>(_initPage);
  }

  Future<FutureOr> _initPage(
      InitSplashEvent event, Emitter<SplashState> emit) async {

    Future.delayed(const Duration(seconds: 2)).then((value) {
      ///IF USER FIRST DOWNLOAD  APP GO TO [OnBoardScreen()]

      if (GetStorage().read('isFirst') != null &&
          GetStorage().read('isFirst') == false) {

        ///IF USER LOGIN GO TO [ProfileScreen()] ELSE GO TO [LoginScreen()]

        if (GetStorage().read('isLogin')!= null &&
            GetStorage().read('isLogin') == true) {
          navKey.currentState!.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) =>
                    ProfileScreen(userId: GetStorage().read('userId') ?? -1),
              ),
                  (route) => false);
        } else {
          navKey.currentState!.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
                  (route) => false);
        }

      } else {
        navKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const OnBoardScreen(),
            ),
                (route) => false);
      }
    });
  }

}
