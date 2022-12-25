import 'package:equatable/equatable.dart';

class Manga extends Equatable {
  final String? id;
  final String? idManga;

  const Manga({this.id, this.idManga});

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        id: json['id'] as String?,
        idManga: json['id_manga'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_manga': idManga,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, idManga];
}
