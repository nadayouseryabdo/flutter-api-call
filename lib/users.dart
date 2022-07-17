import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'details.dart';

void main()=> runApp(const UsersClass());
class UsersClass extends StatefulWidget {
  const UsersClass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends State<UsersClass> {
  late Future<List<User>> user;
  @override
  void initState() {
    super.initState();
    user = Data().fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: FutureBuilder(
    future: user,
    builder: (context,snapshot){
      if (snapshot.hasData) {
        var allusers = (snapshot.data as List<User>);
        return ListView.builder(
            itemCount: allusers.length,
            itemBuilder: (context, index) => UserListItem(allusers[index])
        );
      }
      return const Center(child: CircularProgressIndicator());
    }
),
    );
  }
}

class UserListItem extends StatelessWidget {
  final allusers;
   UserListItem(this.allusers);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 150,
        child: Center(
            child: Card(
              child: Row(
                children: [
                  Image.network(allusers.picture),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(allusers.id),
                      Text(allusers.title),
                    ],
                  ),
                ],
              ),
            )),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Details(allusers.title , allusers.content),
          ),
        );
      },
    );
  }
}

//data layer
class User {
  String title;
  String picture;
  String content;
  String id;

  User(
     this.title,
     this.picture,
     this.content,
     this.id,
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json['title'],
        json['picture'],
        json['content'],
        json['id'],
    );
  }
}

class Data {
  Future<List<User>> fetchUsers() async {
    var response = await http.get(Uri.parse('https://62d4154fcd960e45d452f790.mockapi.io/api/article'));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var list = (jsonResponse as List);
      var newList = list.map((item) => User.fromJson(item)).toList();
      return newList;
    } else {
      throw Exception('Can not fetch user');
    }
  }
}