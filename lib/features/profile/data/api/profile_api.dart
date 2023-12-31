import 'package:bloc_example/core/models/user_model.dart';
import 'package:bloc_example/core/services/api_helper.dart';

class ProfileApi {
  ApiHelper helper = ApiHelper();

  Future<UserModel> getUserById(int id) async {
    try {
      var res = await helper.get(url: 'users/$id');
      return UserModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
