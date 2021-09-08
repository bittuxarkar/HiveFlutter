import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/adapter/my_adapter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/view/add_tolist.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewList()));
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "App Bar",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<MyList>("MyList").listenable(),
          builder: (context, Box<MyList> box, _) {
            if (box.values.isEmpty) {
              return Center(
                child: Text(
                  "No Data Available",
                  style: TextStyle(fontSize: 30),
                ),
              );
            }
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  MyList? myList = box.getAt(index);
                  return ListTile(
                    onLongPress: () async {
                      await box.deleteAt(index);
                    },
                    title: Text(myList!.name),
                    subtitle: Text(myList.emailid),
                  );
                });
          }),
    );
  }
}
