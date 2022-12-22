import 'package:equatable/equatable.dart';

class Title extends Equatable {
  final String? en;
  final String? jaRo;
  final String? ja;

  const Title({this.en, this.jaRo, this.ja});

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json['en'] as String?,
        jaRo: json['ja-ro'] as String?,
        ja: json['ja'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
        'ja-ro': jaRo,
        'ja': ja,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en, jaRo, ja];
}
