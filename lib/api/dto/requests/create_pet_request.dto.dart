import 'package:json_annotation/json_annotation.dart';

part 'create_pet_request.dto.g.dart';

@JsonSerializable()
class CreatePetRequestDto {
  final String type;
  final String name;
  final bool sex;
  final bool isCastrated;
  final String description;

  CreatePetRequestDto(
      {required this.type,
      required this.name,
      required this.sex,
      required this.isCastrated,
      required this.description});

  factory CreatePetRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePetRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePetRequestDtoToJson(this);
}
