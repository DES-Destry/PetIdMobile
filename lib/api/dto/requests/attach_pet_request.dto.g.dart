// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attach_pet_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachPetRequestDto _$AttachPetRequestDtoFromJson(Map<String, dynamic> json) =>
    AttachPetRequestDto(
      petId: json['petId'] as String,
      tagCode: json['tagCode'] as String,
    );

Map<String, dynamic> _$AttachPetRequestDtoToJson(
        AttachPetRequestDto instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'tagCode': instance.tagCode,
    };
