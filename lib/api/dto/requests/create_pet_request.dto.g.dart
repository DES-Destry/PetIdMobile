// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_pet_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePetRequestDto _$CreatePetRequestDtoFromJson(Map<String, dynamic> json) =>
    CreatePetRequestDto(
      type: json['type'] as String,
      name: json['name'] as String,
      sex: json['sex'] as bool,
      isCastrated: json['isCastrated'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreatePetRequestDtoToJson(
        CreatePetRequestDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'sex': instance.sex,
      'isCastrated': instance.isCastrated,
      'description': instance.description,
    };
