import 'package:equatable/equatable.dart';

class Relationship extends Equatable {
  final String? id;
  final String? type;

  const Relationship({this.id, this.type});

  factory Relationship.fromJson(Map<String, dynamic> json) => Relationship(
        id: json['id'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, type];
}
