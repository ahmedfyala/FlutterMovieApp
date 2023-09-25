// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDitailsAdapter extends TypeAdapter<MovieDitails> {
  @override
  final int typeId = 0;

  @override
  MovieDitails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieDitails(
      isMarked: fields[2] as bool,
      idFirebase: fields[1] as String?,
      title: fields[10] as String,
      id: fields[5] as int,
      adult: fields[0] as bool?,
      backdrop_path: fields[3] as String,
      genre_ids: (fields[4] as List?)?.cast<int>(),
      overview: fields[6] as String,
      popularity: fields[7] as num?,
      poster_path: fields[8] as String,
      release_date: fields[9] as String,
      vote_average: fields[11] as num?,
      vote_count: fields[12] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieDitails obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.idFirebase)
      ..writeByte(2)
      ..write(obj.isMarked)
      ..writeByte(3)
      ..write(obj.backdrop_path)
      ..writeByte(4)
      ..write(obj.genre_ids)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.poster_path)
      ..writeByte(9)
      ..write(obj.release_date)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.vote_average)
      ..writeByte(12)
      ..write(obj.vote_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDitailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
