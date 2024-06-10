import 'package:json_annotation/json_annotation.dart';

part 'pet_response.dto.g.dart';

@JsonSerializable()
class PetResponseDto {
  final String type;
  final String name;
  final bool sex;
  final bool isCastrated;
  final String photo;
  final String description;

  PetResponseDto(
      {required this.type,
      required this.name,
      required this.sex,
      required this.isCastrated,
      required this.photo,
      required this.description});

  factory PetResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PetResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PetResponseDtoToJson(this);
}
