import 'package:bloc_example/core/models/user_model.dart';
import 'package:bloc_example/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final ScreenStatus status;
  final UserModel userModel;

  const ProfileState(
      {this.status = ScreenStatus.initial, required this.userModel});

  ProfileState copyWith({
    ScreenStatus? status,
    UserModel? userModel,
  }) {
    return ProfileState(
        status: status ?? this.status, userModel: userModel ?? this.userModel);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, userModel];
}
