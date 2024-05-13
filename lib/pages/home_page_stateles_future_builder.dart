import 'package:flutter/material.dart';
import 'package:getapi/model/user.dart';
import 'package:getapi/service/user_service.dart';

class HomePageStatelesFutureBuilder extends StatelessWidget {
  const HomePageStatelesFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api future builder panda'),
      ),
      body: FutureBuilder<List<User>>(
        future: UserService.fetchUsers(),
        builder: (context, snapshot){
          final users = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator()
            ,);
          }

          if (snapshot.hasError){
            return Center(child: Text('Eror'),);
          }

          return ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) {
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
          );
      },),
    );
  }
}