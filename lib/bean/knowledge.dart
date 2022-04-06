import 'dart:convert';

Knowledge knowledgeFromJson(dynamic str) => Knowledge.fromJson(json.decode(str));

String knowledgeToJson(Knowledge data) => json.encode(data.toJson());

class Knowledge {
  Knowledge({
    this.issue,
    this.parse,
  });

  String? issue;
  String? parse;

  factory Knowledge.fromJson(Map<String, dynamic> json) => Knowledge(
    issue: json["issue"],
    parse: json["parse"],
  );

  Map<String, dynamic> toJson() => {
    "issue": issue,
    "parse": parse,
  };
}
