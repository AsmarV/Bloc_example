
import 'package:bloc_example/features/auth/login/bloc/login_states.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_form_field.dart';
import '../../../../shared/widgets/logo_view.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_events.dart';

class LoginFormUi extends StatelessWidget {
  const LoginFormUi({super.key, required this.state, required this.bloc});

  final LoginStates state;
  final LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sized16()*2),
      child: Form(
        key: state.formKey,
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            const LogoView(),
            SizedBox(
              height: sized16() / 2,
            ),
            CustomFormField(
              controller: state.username,
              hint: 'Username',
              iconData: Icons.supervised_user_circle,
              isRequired: true,
            ),
            SizedBox(
              height: sized16(),
            ),
            CustomFormField(
              controller: state.password,
              hint: 'Password',
              isPassword: true,
              iconData: Icons.key,
              isRequired: true,
            ),
            SizedBox(
              height: sized16() * 2,
            ),
            CustomButton(
              title: 'Login',
              onPressed: () {
                bloc.add(LoginClickEvent(
                    username: state.username.text,
                    password: state.password.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
