import 'package:json_annotation/json_annotation.dart';

part 'create_owner_request.dto.g.dart';

@JsonSerializable()
class CreateOwnerRequestDto {
  final String email;
  final String password;
  final String name;
  final String address;
  final String description;

  CreateOwnerRequestDto(
      {required this.email,
      required this.password,
      required this.name,
      required this.address,
      required this.description});

  factory CreateOwnerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateOwnerRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOwnerRequestDtoToJson(this);
}
