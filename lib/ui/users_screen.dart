import 'package:flutter/material.dart';
import 'package:show_user/data/index.dart';
import 'package:show_user/ui/shimmer_list_tile.dart';
import 'package:show_user/ui/user_controller.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final _controller = UserController(UserRepo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        child: FutureBuilder(
          future: _controller.getUsers(),
          builder: (context, snapshot) {
            final users = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting ||
                users == null) {
              return ListView.builder(
                itemCount: 5, // Display at least 5 shimmer tiles
                itemBuilder: (context, index) {
                  return const ShimmerListTile();
                },
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () {},
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
