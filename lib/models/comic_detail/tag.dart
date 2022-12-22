import 'package:cc_jabs_manga_app/models/comic_detail/attributes3.dart';
import 'package:equatable/equatable.dart';

import 'attributes1.dart';

class Tag extends Equatable {
  final Attributes3? attributes;

  const Tag({this.attributes});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        attributes: json['attributes'] == null
            ? null
            : Attributes3.fromJson(json['attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'attributes': attributes?.toJson(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [attributes];
}
