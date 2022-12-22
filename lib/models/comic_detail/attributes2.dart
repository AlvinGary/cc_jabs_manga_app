import 'package:equatable/equatable.dart';

class Attributes2 extends Equatable {
  final String? fileName;

  const Attributes2({this.fileName});

  factory Attributes2.fromJson(Map<String, dynamic> json) =>
      Attributes2(fileName: json['fileName'] as String?);

  Map<String, dynamic> toJson() => {'fileName': fileName};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fileName];
}
