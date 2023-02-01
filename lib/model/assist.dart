// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Assist {
  int id;
  String name;
  String description;
  Assist({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Assist.fromMap(Map<String, dynamic> map) {
    return Assist(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Assist.fromJson(String source) =>
      Assist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Assist(id: $id, name: $name, description: $description)';
}
