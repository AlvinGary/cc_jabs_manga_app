import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String? en;

  const Name({this.en});

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'en': en,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [en];
}
