import 'dart:async';

import 'package:bloc_example/app.dart';
import 'package:bloc_example/core/models/user_model.dart';
import 'package:bloc_example/core/utils/enums.dart';
import 'package:bloc_example/core/utils/snack_bar.dart';
import 'package:bloc_example/features/onboarding/splash/screen/splash_screen.dart';
import 'package:bloc_example/features/profile/bloc/profile_events.dart';
import 'package:bloc_example/features/profile/bloc/profile_states.dart';
import 'package:bloc_example/features/profile/data/api/profile_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileBloc() : super(ProfileState(userModel: UserModel())) {
    on<GetProfileEvent>(_getUserInformation);
    on<LogoutProfileEvent>(_logout);
  }

  Future<FutureOr> _getUserInformation(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ScreenStatus.loading));
    await ProfileApi().getUserById(event.id).then((value) {
      emit(state.copyWith(status: ScreenStatus.success, userModel: value));
    }).catchError((e) {
      emit(state.copyWith(status: ScreenStatus.error));
      customSnack(title: e, type: 'error');
    });
  }

  Future<FutureOr> _logout(
      LogoutProfileEvent event, Emitter<ProfileState> emit) async {
    GetStorage().remove('userId');
    GetStorage().write('isLogin', false);
    navKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
        (route) => false);
  }
}
