
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';

class OnboardState extends Equatable {
  final ScreenStatus status;
  final List<Map<String, dynamic>> pages;
  final int currentPage;

  const OnboardState(
      {
      this.status = ScreenStatus.initial,
      this.pages = const [
        {
          'id':0,
          'title': 'Welcome',
          'description':
              "We're so glad you're here.\nCome on in and make self at home.",
          'img': 'assets/images/onboard_1.png'
        },
        {
          'id':1,
          'title': 'How to use ?',
          'description':
              'Create an account or log-in\nwith your existing credentials.',
          'img': 'assets/images/onboard_2.png'
        },
      ],
      this.currentPage = 0
      });

  OnboardState copyWith({
    ScreenStatus? status,
    List<Map<String, dynamic>>? pages,
    int? currentPage,
  }) {
    return OnboardState(
        currentPage: currentPage ?? this.currentPage,
        pages: pages ?? this.pages,
        status: status ?? this.status);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [pages, currentPage, status];
}
