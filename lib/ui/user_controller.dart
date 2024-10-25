import 'package:show_user/data/index.dart';

class UserController {
  final Repo _repo;

  UserController(this._repo);

  Future<List<User>> getUsers() {
    return _repo.getUsers();
  }
}
