// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetResponseDto _$PetResponseDtoFromJson(Map<String, dynamic> json) =>
    PetResponseDto(
      type: json['type'] as String,
      name: json['name'] as String,
      sex: json['sex'] as bool,
      isCastrated: json['isCastrated'] as bool,
      photo: json['photo'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PetResponseDtoToJson(PetResponseDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'sex': instance.sex,
      'isCastrated': instance.isCastrated,
      'photo': instance.photo,
      'description': instance.description,
    };
