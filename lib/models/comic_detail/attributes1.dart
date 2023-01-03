import 'package:equatable/equatable.dart';

import 'alt_title.dart';
import 'description.dart';
import 'tag.dart';
import 'title.dart';

class Attributes1 extends Equatable {
  final Title? title;
  final List<AltTitle>? altTitles;
  final Description? description;
  final String? status;
  final int? year;
  final List<Tag>? tags;

  const Attributes1({
    this.title,
    this.altTitles,
    this.description,
    this.status,
    this.year,
    this.tags,
  });

  factory Attributes1.fromJson(Map<String, dynamic> json) => Attributes1(
        title: json['title'] == null
            ? null
            : Title.fromJson(json['title'] as Map<String, dynamic>),
        altTitles: (json['altTitles'] as List<dynamic>?)
            ?.map((e) => AltTitle.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] == null
            ? null
            : Description.fromJson(json['description'] as Map<String, dynamic>),
        status: json['status'] as String?,
        year: json['year'] as int?,
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'title': title?.toJson(),
        'altTitles': altTitles?.map((e) => e.toJson()).toList(),
        'description': description?.toJson(),
        'status': status,
        'year': year,
        'tags': tags?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      title,
      altTitles,
      description,
      status,
      year,
      tags,
    ];
  }
}
