import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/adapter/my_adapter.dart';

class NewList extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _NewListState createState() => _NewListState();
}

class _NewListState extends State<NewList> {
  late String name, emailid;

  submitData() async {
    if (widget.formKey.currentState!.validate()) {
      Box<MyList> listBox = Hive.box<MyList>('MyList');
      listBox.add(MyList(name: name, emailid: emailid));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add to List",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Form(
        key: widget.formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Email_id",
              ),
              onChanged: (value) {
                setState(() {
                  emailid = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: ()=>submitData(),
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
