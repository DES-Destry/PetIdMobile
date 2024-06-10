// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) =>
    AuthResponseDto(
      email: json['email'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      pets: (json['pets'] as List<dynamic>)
          .map((e) => PetResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AuthResponseDtoToJson(AuthResponseDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'pets': instance.pets,
    };
