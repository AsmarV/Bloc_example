import 'dart:async';
import 'package:bloc_example/app.dart';
import 'package:bloc_example/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/utils/snack_bar.dart';
import '../data/api/login_api.dart';
import 'login_events.dart';
import 'login_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginClickEvent>(_loginAuth);
  }

  //Test user:
  //username : kminchelle
  //password : 0lelplR
  Future<FutureOr> _loginAuth(
      LoginClickEvent event, Emitter<LoginStates> emit) async {
    if (state.formKey.currentState!.validate()) {
      emit(state.copyWith(status: ScreenStatus.loading));
      await LoginApi()
          .login(username: event.username, password: event.password)
          .then((value) {
        customSnack(title: "success", type: 'success');
        GetStorage().write('userId', value.id ?? -1);
        GetStorage().write('isLogin', true);
        navKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ProfileScreen(userId: value.id ?? -1),
            ),
            (route) => false);
        emit(state.copyWith(status: ScreenStatus.initial));
      }).catchError((e) {
        emit(state.copyWith(status: ScreenStatus.initial));
        customSnack(title: e.toString(), type: 'error');
      });
    }
  }
}
