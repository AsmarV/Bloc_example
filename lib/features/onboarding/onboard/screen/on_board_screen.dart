import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/responsive.dart';
import '../../../../app.dart';
import '../bloc/onboard_bloc.dart';
import '../bloc/onboard_events.dart';
import '../bloc/onboard_states.dart';
import '../widgets/page_view.dart';
import '../widgets/row_counter_view.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///INITIAL BLOC
    var bloc = OnboardBloc();

    ///BUILD BLOC
    return BlocBuilder<OnboardBloc, OnboardState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        backgroundColor: backGroundColorWh,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (drag) {
            bloc.add(ChangeAxisEvent(
                xAxis: drag.velocity.pixelsPerSecond.dx,
                yAxis: drag.velocity.pixelsPerSecond.dy));
          },
          child: Stack(
            children: [
              PageViewUI(state: state),
              RowCounterUI(state: state)
            ],
          ),
        ),
        floatingActionButton: _floatingActionButton(state, bloc),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      ),
    );
  }

  ///FLOATING BUTTON
  Widget _floatingActionButton(OnboardState state, OnboardBloc bloc) {
    return FloatingActionButton(
      onPressed: () {
        bloc.add(NextPageEvent());
      },
      child: Text(
        state.currentPage < state.pages.length - 1 ? 'Next' : 'Finish',
        style: const TextStyle(color: whiteC),
      ),
    );
  }
}
