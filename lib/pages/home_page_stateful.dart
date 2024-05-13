import 'package:flutter/material.dart';
import 'package:getapi/model/user.dart';
import 'package:getapi/service/user_service.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<User> users = [];
  void fetchUsers() async{
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api Panda')
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          final User = users[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(User.avatar),
                ),
              title: Text('${User.firstName} ${User.lastName}'),
              subtitle: Text(User.email),
            ),
          );
        },
        ),
    );
  }
}