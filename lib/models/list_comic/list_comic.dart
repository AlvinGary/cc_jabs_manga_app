part of '../models.dart';

class ListComic extends Equatable {
  final String? id;
  final attributeslistcomic.Attributes1? attributes;
  final List<relationlistcomic.Relationship>? relationships;

  const ListComic({this.id, this.attributes, this.relationships});

  factory ListComic.fromJson(Map<String, dynamic> json) => ListComic(
        id: json['id'] as String?,
        attributes: json['attributes'] == null
            ? null
            : attributeslistcomic.Attributes1.fromJson(json['attributes'] as Map<String, dynamic>),
        relationships: (json['relationships'] as List<dynamic>?)
            ?.map((e) => relationlistcomic.Relationship.fromJson(e as Map<String, dynamic>))
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
