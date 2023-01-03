import 'package:equatable/equatable.dart';

class Attributes3 extends Equatable {
  final String? tagname;

  const Attributes3({this.tagname});

  factory Attributes3.fromJson(Map<String, dynamic> json) =>
      Attributes3(tagname: json['name']['en'] as String?);

  Map<String, dynamic> toJson() => {'tagname': tagname};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [tagname];
}
