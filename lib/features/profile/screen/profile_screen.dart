import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_example/core/utils/enums.dart';
import 'package:bloc_example/shared/widgets/custom_loading.dart';

import '../bloc/profile_bloc.dart';
import '../bloc/profile_events.dart';
import '../bloc/profile_states.dart';
import '../widgets/profile_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    var bloc = ProfileBloc();
    bloc.add(GetProfileEvent(id: userId));

    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: bloc,
      builder: (context, state) {
        return _buildUI(state, bloc);
      },
    );
  }

  _buildUI(ProfileState state, ProfileBloc bloc) {
    switch (state.status) {
      case ScreenStatus.initial:
        return const SizedBox();
      case ScreenStatus.loading:
        return const Stack(
          children: [
            Scaffold(),
            CustomLoading(),
          ],
        );
      case ScreenStatus.success:
        return ProfileUI(
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
