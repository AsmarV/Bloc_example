
abstract class LoginEvents{}

class LoginClickEvent extends LoginEvents{
  String username;
  String password;

  LoginClickEvent({required this.username, required this.password});
}