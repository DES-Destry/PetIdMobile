import 'package:json_annotation/json_annotation.dart';

part 'maintenance_status_response.dto.g.dart';

@JsonSerializable()
class MaintenanceStatusResponseDto {
  final bool appShouldBeBlocked;
  final DateTime? appWillClosedAt;

  MaintenanceStatusResponseDto(
      {required this.appShouldBeBlocked, this.appWillClosedAt});

  factory MaintenanceStatusResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceStatusResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceStatusResponseDtoToJson(this);
}
