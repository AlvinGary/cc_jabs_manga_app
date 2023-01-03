import 'package:equatable/equatable.dart';

class Attributes2 extends Equatable {
  final String? name;
  final String? fileName;

  const Attributes2({this.fileName, this.name});

  factory Attributes2.fromJson(Map<String, dynamic> json) =>
      Attributes2(fileName: json['fileName'] as String?, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'fileName': fileName, 'name': name};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fileName,name];
}
