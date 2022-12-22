part of "models.dart";

class ChapterPage extends Equatable {
  final String? hash;
  final List<String>? data;

  const ChapterPage({this.hash, this.data});

  factory ChapterPage.fromJson(Map<String, dynamic> json) => ChapterPage(
        hash: json['hash'] as String?,
        data: json['data'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'hash': hash,
        'data': data,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [hash, data];
}
