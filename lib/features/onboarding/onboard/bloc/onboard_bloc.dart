import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../app.dart';
import '../../../auth/login/screen/login_screen.dart';
import 'onboard_events.dart';
import 'onboard_states.dart';


class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(const OnboardState()) {
    on<ChangeAxisEvent>(_changeAxis);
    on<NextPageEvent>(_nextPage);
  }

  FutureOr _changeAxis(ChangeAxisEvent event, Emitter<OnboardState> emit) {
    if (event.xAxis! < 0) {
      if (state.currentPage < state.pages.length - 1) {
        emit(state.copyWith(currentPage: state.currentPage + 1));
      }
    } else if (event.xAxis! > 0) {
      if (state.currentPage > 0) {
        emit(state.copyWith(currentPage: state.currentPage - 1));
      }
    }
  }

  FutureOr _nextPage(NextPageEvent event, Emitter<OnboardState> emit) {
    if (state.currentPage < state.pages.length - 1) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }else if( state.currentPage == state.pages.length -1  ){
      _goToPageLogin();
    }
  }

  _goToPageLogin() {
    GetStorage().write('isFirst', false);
    navKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }
}
