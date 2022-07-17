import 'package:flutter/material.dart';

class Details extends StatelessWidget{
var title;
var content;
Details(this.title , this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child:Container(
          margin: const EdgeInsets.all(15) ,
            // padding: EdgeInsets.only(top: 40.0)
          child: Column(
            children: [
              Title(color: Colors.purpleAccent, child: Text(title,
                style: const TextStyle(fontSize: 20.0,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.bold),)),
              Container(
                padding: const EdgeInsets.all(15) ,
                child: Text(content),
              )
            ],
          ),
        ),
      ),
    );
  }
}