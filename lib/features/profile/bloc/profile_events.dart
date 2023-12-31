abstract class ProfileEvents{}

class GetProfileEvent extends ProfileEvents{
  int id;
  GetProfileEvent({required this.id});
}

class LogoutProfileEvent extends ProfileEvents{}