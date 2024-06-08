// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_status_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceStatusResponseDto _$MaintenanceStatusResponseDtoFromJson(
        Map<String, dynamic> json) =>
    MaintenanceStatusResponseDto(
      appShouldBeBlocked: json['appShouldBeBlocked'] as bool,
      appWillClosedAt: json['appWillClosedAt'] == null
          ? null
          : DateTime.parse(json['appWillClosedAt'] as String),
    );

Map<String, dynamic> _$MaintenanceStatusResponseDtoToJson(
        MaintenanceStatusResponseDto instance) =>
    <String, dynamic>{
      'appShouldBeBlocked': instance.appShouldBeBlocked,
      'appWillClosedAt': instance.appWillClosedAt?.toIso8601String(),
    };
