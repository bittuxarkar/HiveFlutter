import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/adapter/my_adapter.dart';
import 'package:project/view/HomePage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MyListAdapter());
  await Hive.openBox<MyList>("MyList");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}
