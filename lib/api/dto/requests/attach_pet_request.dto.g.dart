// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attach_pet_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachPetRequestDto _$AttachPetRequestDtoFromJson(Map<String, dynamic> json) =>
    AttachPetRequestDto(
      petId: json['petId'] as String,
      tagId: json['tagId'] as int,
    );

Map<String, dynamic> _$AttachPetRequestDtoToJson(
        AttachPetRequestDto instance) =>
    <String, dynamic>{
      'petId': instance.petId,
      'tagCode': instance.tagId,
    };
