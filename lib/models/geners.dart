import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({
    required this.name,
    required this.id,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      name: json['name'],
      id: json['id'],
    );
  }

  @override
  List<Object> get props => [name, id];
}
