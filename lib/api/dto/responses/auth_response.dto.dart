import 'package:json_annotation/json_annotation.dart';
import 'package:pet_id_mobile/api/dto/responses/pet_response.dto.dart';

part 'auth_response.dto.g.dart';

@JsonSerializable()
class AuthResponseDto {
  final String email;
  final String name;
  final String address;
  final String description;
  final List<PetResponseDto> pets;

  AuthResponseDto(
      {required this.email,
      required this.name,
      required this.address,
      required this.description,
      required this.pets});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}
