import 'package:equatable/equatable.dart';

import 'alt_title.dart';
import 'title.dart';

class Attributes1 extends Equatable {
  final Title? title;
  final List<AltTitle>? altTitles;
  final String? lastChapter;
  final String? updatedAt;

  const Attributes1({
    this.title,
    this.altTitles,
    this.lastChapter,
    this.updatedAt,
  });

  factory Attributes1.fromJson(Map<String, dynamic> json) => Attributes1(
        title: json['title'] == null
            ? null
            : Title.fromJson(json['title'] as Map<String, dynamic>),
        altTitles: (json['altTitles'] as List<dynamic>?)
            ?.map((e) => AltTitle.fromJson(e as Map<String, dynamic>))
            .toList(),
        lastChapter: json['lastChapter'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title?.toJson(),
        'altTitles': altTitles?.map((e) => e.toJson()).toList(),
        'lastChapter': lastChapter,
        'updatedAt': updatedAt,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [title, altTitles, lastChapter, updatedAt];
}
