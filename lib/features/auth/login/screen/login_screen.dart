import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../../shared/widgets/custom_loading.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_states.dart';
import '../widgets/login_form_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = LoginBloc();
    return BlocBuilder<LoginBloc, LoginStates>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          body: _buildUI(state, bloc),
        );
      },
    );
  }

  _buildUI(LoginStates state, LoginBloc bloc) {
    switch (state.status) {
      case ScreenStatus.initial:
        return LoginFormUi(
          state: state,
          bloc: bloc,
        );
      case ScreenStatus.loading:
        return Stack(
          children: [
            LoginFormUi(
              state: state,
              bloc: bloc,
            ),
            const CustomLoading(),
          ],
        );
      case ScreenStatus.success:
        return LoginFormUi(
          state: state,
          bloc: bloc,
        );
      case ScreenStatus.error:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
