import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final double? bayesian;

  const Rating({this.bayesian});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        bayesian: (json['bayesian'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'bayesian': bayesian,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [bayesian];
}
