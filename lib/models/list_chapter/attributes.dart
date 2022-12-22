import 'package:equatable/equatable.dart';

class Attributes extends Equatable {
  final String? volume;
  final String? chapter;
  final String? title;
  final String? translatedLanguage;
  final String? updatedAt;

  const Attributes({
    this.volume,
    this.chapter,
    this.title,
    this.translatedLanguage,
    this.updatedAt,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        volume: json['volume'] as String?,
        chapter: json['chapter'] as String?,
        title: json['title'] as String?,
        translatedLanguage: json['translatedLanguage'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'volume': volume,
        'chapter': chapter,
        'title': title,
        'translatedLanguage': translatedLanguage,
        'updatedAt': updatedAt,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      volume,
      chapter,
      title,
      translatedLanguage,
      updatedAt,
    ];
  }
}
