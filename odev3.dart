import 'package:flutter/material.dart';
import 'package:odevv3/my_flutter_app_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffBDF5F2),
        appBar: AppBar(
          toolbarHeight: 120,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.dehaze,
              color: Color(0xffBDF5F2),
              size: 50,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: Color(0xffBDF5F2),
                  size: 50,
                ),
                onPressed: () {
                  print("İnsan ikonuna tıklandı!");
                })
          ],
          backgroundColor: Colors.indigo,
          title: Center(
            child: Text(
              "Hi-Kod",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 250,
            height: 130,
            margin: EdgeInsets.all(15.0),
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(65.0),
              color: Colors.indigo,
            ),
            child: Center(
              child: Text(
                "Hello World",
                style: TextStyle(
                    color: Color(0xffBDF5F2),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
