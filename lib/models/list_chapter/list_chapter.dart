part of '../models.dart';

class ListChapter extends Equatable {
  final String? id;
  final attributeslistchapter.Attributes? attributes;
  final List<relationlistchapter.Relationship>? relationships;

  const ListChapter({this.id, this.attributes, this.relationships});

  factory ListChapter.fromJson(Map<String, dynamic> json) => ListChapter(
        id: json['id'] as String?,
        attributes: json['attributes'] == null
            ? null
            : attributeslistchapter.Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
        relationships: (json['relationships'] as List<dynamic>?)
            ?.map((e) => relationlistchapter.Relationship.fromJson(
                e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes?.toJson(),
        'relationships': relationships?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, attributes, relationships];
}
