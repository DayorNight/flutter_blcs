import 'package:hive_flutter/hive_flutter.dart';
part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject{
  Person({required this.name, required this.age});

  @HiveField(0)
  String? name;

  @HiveField(1)
  int? age;

}
