import 'package:cc_jabs_manga_app/models/comic_detail/attributes2.dart';
import 'package:equatable/equatable.dart';

import 'attributes1.dart';

class Relationship extends Equatable {
  final String? id;
  final String? type;
  final Attributes2? attributes;
  final String? related;

  const Relationship({this.id, this.type, this.attributes, this.related});

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json['id'] as String?,
        type: json['type'] as String?,
        attributes: json['attributes'] == null
            ? null
            : Attributes2.fromJson(json['attributes'] as Map<String, dynamic>),
        related: json['related'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'attributes': attributes?.toJson(),
        'related': related,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type, attributes, related];
}
