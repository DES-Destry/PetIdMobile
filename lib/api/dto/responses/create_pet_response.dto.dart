import 'package:json_annotation/json_annotation.dart';

part 'create_pet_response.dto.g.dart';

@JsonSerializable()
class CreatePetResponseDto {
  final String petId;

  CreatePetResponseDto({required this.petId});

  factory CreatePetResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePetResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePetResponseDtoToJson(this);
}
