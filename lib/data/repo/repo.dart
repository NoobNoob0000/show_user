import 'package:show_user/data/model/user.dart';

abstract class Repo {
  Future<List<User>> getUsers();
}
