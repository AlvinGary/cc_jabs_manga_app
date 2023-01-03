import 'package:equatable/equatable.dart';

import 'attributes1.dart';
import 'relationship.dart';

class ComicDetail extends Equatable {
  final String? id;
  final String? type;
  final Attributes1? attributes;
  final List<Relationship>? relationships;

  const ComicDetail({this.id, this.type, this.attributes, this.relationships});

  factory ComicDetail.fromJson(Map<String, dynamic> json) => ComicDetail(
        id: json['id'] as String?,
        type: json['type'] as String?,
        attributes: json['attributes'] == null
            ? null
            : Attributes1.fromJson(json['attributes'] as Map<String, dynamic>),
        relationships: (json['relationships'] as List<dynamic>?)
            ?.map((e) => Relationship.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'attributes': attributes?.toJson(),
        'relationships': relationships?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type, attributes, relationships];
}
