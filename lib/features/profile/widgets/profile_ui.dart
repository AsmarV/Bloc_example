

import 'package:bloc_example/features/profile/bloc/profile_bloc.dart';
import 'package:bloc_example/features/profile/bloc/profile_states.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';
import '../../../core/utils/responsive.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_form_field.dart';
import '../bloc/profile_events.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key, required this.state, required this.bloc});

  final ProfileState state;
  final ProfileBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(sized16()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(sized16()),
              width: wi(3),
              height: wi(3),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: primeColor, width: 0.5),
                  image: DecorationImage(
                    image: NetworkImage(state.userModel.image ?? ''),
                  )),
            ),
            SizedBox(
              height: sized16(),
              width: fullWi(),
            ),
            Text(
              state.userModel.getFullName(),
              style: TextStyle(fontSize: font(0.35), color: primeColor),
            ),
            SizedBox(
              height: sized16(),
            ),
            CustomFormField(
              hint: 'Username',
              controller: TextEditingController(
                  text: state.userModel.username ?? ''),
              isEnable: false,
              iconData: Icons.supervised_user_circle_outlined,
            ),
            SizedBox(
              height: sized16(),
            ),
            CustomFormField(
              hint: 'Email',
              controller: TextEditingController(
                  text: state.userModel.email ?? ''),
              isEnable: false,
              iconData: Icons.email_outlined,
            ),
            SizedBox(
              height: sized16(),
            ),
            CustomFormField(
              hint: 'Phone',
              controller: TextEditingController(
                  text: state.userModel.phone ?? ''),
              isEnable: false,
              iconData: Icons.phone_outlined,
            ),
            SizedBox(
              height: sized16()*2,
            ),
            CustomButton(title: 'Logout', onPressed: (){
              bloc.add(LogoutProfileEvent());
            },)

          ],
        ),
      ),
    );
  }
}
