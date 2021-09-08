import 'package:hive/hive.dart';

part 'my_adapter.g.dart';

@HiveType(typeId: 1)
class MyList {
  @HiveField(0)
  String name;
  @HiveField(1)
  String emailid;

  MyList({required this.name, required this.emailid});
}
