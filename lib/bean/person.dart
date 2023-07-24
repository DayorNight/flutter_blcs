import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Person extends HiveObject{
  Person({required this.name, required this.age, required this.friends});

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  List<String> friends;

  @override
  String toString() {
    return '$name: $age';
  }
}
