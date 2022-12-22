import 'package:equatable/equatable.dart';

class AltTitle extends Equatable {
  final String? en;
  final String? jaRo;
  final String? ja;

  const AltTitle({this.jaRo, this.ja, this.en});

  factory AltTitle.fromJson(Map<String, dynamic> json) => AltTitle(
        jaRo: json['ja-ro'] as String?,
        ja: json['ja'] as String?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ja-ro': jaRo,
        'ja': ja,
        'en': en,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [jaRo, ja, en];
}
