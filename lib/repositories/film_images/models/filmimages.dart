import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filmimages.g.dart';

@JsonSerializable()
class FilmImages extends Equatable {
  const FilmImages({required this.imageUrl, required this.previewUrl});

  final String imageUrl;
  final String previewUrl;

  factory FilmImages.fromJson(Map<String, dynamic> json) =>
      _$FilmImagesFromJson(json);
  Map<String, dynamic> toJson() => _$FilmImagesToJson(this);

  @override
  List<Object?> get props => [imageUrl, previewUrl];
}
