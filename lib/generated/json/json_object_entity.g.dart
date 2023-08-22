import 'package:flutter_blcs/generated/json/base/json_convert_content.dart';
import 'package:flutter_blcs/bean/json_object_entity.dart';

JsonObjectEntity $JsonObjectEntityFromJson(Map<String, dynamic> json) {
	final JsonObjectEntity jsonObjectEntity = JsonObjectEntity();
	final int? year = jsonConvert.convert<int>(json['year']);
	if (year != null) {
		jsonObjectEntity.year = year;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		jsonObjectEntity.name = name;
	}
	final JsonObjectChildren? children = jsonConvert.convert<JsonObjectChildren>(json['children']);
	if (children != null) {
		jsonObjectEntity.children = children;
	}
	final List<JsonObjectList>? list = jsonConvert.convertListNotNull<JsonObjectList>(json['list']);
	if (list != null) {
		jsonObjectEntity.list = list;
	}
	return jsonObjectEntity;
}

Map<String, dynamic> $JsonObjectEntityToJson(JsonObjectEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['year'] = entity.year;
	data['name'] = entity.name;
	data['children'] = entity.children?.toJson();
	data['list'] =  entity.list?.map((v) => v.toJson()).toList();
	return data;
}

JsonObjectChildren $JsonObjectChilrenFromJson(Map<String, dynamic> json) {
	final JsonObjectChildren jsonObjectChilren = JsonObjectChildren();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		jsonObjectChilren.name = name;
	}
	return jsonObjectChilren;
}

Map<String, dynamic> $JsonObjectChilrenToJson(JsonObjectChildren entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	return data;
}

JsonObjectList $JsonObjectListFromJson(Map<String, dynamic> json) {
	final JsonObjectList jsonObjectList = JsonObjectList();
	final String? book = jsonConvert.convert<String>(json['book']);
	if (book != null) {
		jsonObjectList.book = book;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		jsonObjectList.name = name;
	}
	return jsonObjectList;
}

Map<String, dynamic> $JsonObjectListToJson(JsonObjectList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['book'] = entity.book;
	data['name'] = entity.name;
	return data;
}