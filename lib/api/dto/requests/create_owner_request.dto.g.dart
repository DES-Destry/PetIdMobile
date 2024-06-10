// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_owner_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOwnerRequestDto _$CreateOwnerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateOwnerRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateOwnerRequestDtoToJson(
        CreateOwnerRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
    };
