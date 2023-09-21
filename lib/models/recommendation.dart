import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdropPath;
  final int id;

  Recommendation({this.backdropPath, required this.id});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      backdropPath: json['backdrop_path'],
      id: json['id'],
    );
  }

  @override
  List<Object?> get props => [backdropPath, id];
}
