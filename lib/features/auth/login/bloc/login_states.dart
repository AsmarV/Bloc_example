import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/enums.dart';

class LoginStates extends Equatable {
  ScreenStatus status;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginStates({this.status = ScreenStatus.initial});

  LoginStates copyWith({
    ScreenStatus? status,
  }) {
    return LoginStates(status: status ?? this.status)
      ..username = username
      ..password = password
      ..formKey = formKey;
  }

  @override
  List<Object?> get props => [status, username, password, formKey];
}
