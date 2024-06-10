// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_tag.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckTagDto _$CheckTagDtoFromJson(Map<String, dynamic> json) => CheckTagDto(
      id: (json['id'] as num).toInt(),
      isFree: json['isFree'] as bool,
      pet: json['pet'] == null
          ? null
          : CheckPetDto.fromJson(json['pet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckTagDtoToJson(CheckTagDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isFree': instance.isFree,
      'pet': instance.pet,
    };
