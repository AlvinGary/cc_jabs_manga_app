import 'attributes2.dart';
import 'package:equatable/equatable.dart';

class Relationship extends Equatable {
  final String? id;
  final String? type;
  final Attributes2? attributes;

  const Relationship({this.id, this.type, this.attributes});

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json['id'] as String?,
        type: json['type'] as String?,
        attributes: json['attributes'] == null
            ? null
            : Attributes2.fromJson(json['attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'attributes': attributes?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type, attributes];
}
