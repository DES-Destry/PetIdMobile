import 'package:json_annotation/json_annotation.dart';

part 'attach_pet_request.dto.g.dart';

@JsonSerializable()
class AttachPetRequestDto {
  final String petId;
  final int tagId;

  AttachPetRequestDto({required this.petId, required this.tagId});

  factory AttachPetRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AttachPetRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttachPetRequestDtoToJson(this);
}
