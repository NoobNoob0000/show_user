import 'dart:convert';

import 'package:show_user/data/index.dart';

import 'package:http/http.dart' as http;

class UserRepo implements Repo {
  @override
  Future<List<User>> getUsers() async {
    final users = <User>[];
    const url = 'https://jsonplaceholder.typicode.com/users';

    final uri = Uri.parse(url);

    final res = await http.get(uri);
    final data = json.decode(res.body) as List;

    for (var json in data) {
      final user = User.fromJson(json);
      users.add(user);
    }
    await Future.delayed(const Duration(seconds: 3));
    return users;
  }
}
