import 'package:flutter_blcs/generated/json/base/json_field.dart';
import 'package:flutter_blcs/generated/json/json_object_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class JsonObjectEntity {
	int? year;
	String? name;
	JsonObjectChildren? children;
	List<JsonObjectList>? list;

	JsonObjectEntity();

	factory JsonObjectEntity.fromJson(Map<String, dynamic> json) => $JsonObjectEntityFromJson(json);

	Map<String, dynamic> toJson() => $JsonObjectEntityToJson(this);

	JsonObjectEntity copyWith({int? year, String? name, JsonObjectChildren? children, List<JsonObjectList>? list}) {
		return JsonObjectEntity()
			..year= year ?? this.year
			..name= name ?? this.name
			..children= children ?? this.children
			..list= list ?? this.list;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JsonObjectChildren {
	String? name;

	JsonObjectChildren();

	factory JsonObjectChildren.fromJson(Map<String, dynamic> json) => $JsonObjectChilrenFromJson(json);

	Map<String, dynamic> toJson() => $JsonObjectChilrenToJson(this);

	JsonObjectChildren copyWith({String? name}) {
		return JsonObjectChildren()
			..name= name ?? this.name;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class JsonObjectList {
	String? book;
	String? name;

	JsonObjectList();

	factory JsonObjectList.fromJson(Map<String, dynamic> json) => $JsonObjectListFromJson(json);

	Map<String, dynamic> toJson() => $JsonObjectListToJson(this);

	JsonObjectList copyWith({String? book, String? name}) {
		return JsonObjectList()
			..book= book ?? this.book
			..name= name ?? this.name;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}