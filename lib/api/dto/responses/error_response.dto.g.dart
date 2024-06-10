// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseDto _$ErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    ErrorResponseDto(
      type: json['type'] as String,
      title: json['title'] as String,
      status: (json['status'] as num).toInt(),
      detail: json['detail'] as String,
      instance: json['instance'] as String,
      code: json['code'] as String,
      stackTrace: json['stackTrace'] as String,
      traceId: json['traceId'] as String,
      metadata: json['metadata'],
    );

Map<String, dynamic> _$ErrorResponseDtoToJson(ErrorResponseDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'status': instance.status,
      'detail': instance.detail,
      'instance': instance.instance,
      'code': instance.code,
      'stackTrace': instance.stackTrace,
      'traceId': instance.traceId,
      'metadata': instance.metadata,
    };
