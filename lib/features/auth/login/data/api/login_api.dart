


import '../../../../../core/models/user_model.dart';
import '../../../../../core/services/api_helper.dart';

class LoginApi {
  ApiHelper helper = ApiHelper();

  Future<UserModel> login(
      {required String username, required String password}) async {
    try {
      var res = await helper.post(url: 'auth/login', body: {
        'username': username,
        'password': password,
      });
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
