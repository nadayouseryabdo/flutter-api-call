import 'package:flutter/material.dart';
import 'package:lab3/details.dart';
import 'package:lab3/users.dart';

void main() {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UsersClass(),
    );
  }
}
