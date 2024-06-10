import 'package:json_annotation/json_annotation.dart';

part 'attach_pet_request.dto.g.dart';

@JsonSerializable()
class AttachPetRequestDto {
  final String petId;
  final String tagCode;

  AttachPetRequestDto({required this.petId, required this.tagCode});

  factory AttachPetRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AttachPetRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttachPetRequestDtoToJson(this);
}
