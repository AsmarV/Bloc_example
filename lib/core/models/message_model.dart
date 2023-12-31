import '../utils/methods_helper.dart';

class Message {
  late String message;

  Message(this.message);

  Message.fromJson(Map<String, dynamic> json) {
    message = getMessages(json['message'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
