import 'package:json_annotation/json_annotation.dart';

part 'token_pair.dto.g.dart';

@JsonSerializable()
class TokenPairDto {
  final String accessToken;
  final String refreshToken;
  final String ownerId;

  TokenPairDto({required this.accessToken,
    required this.refreshToken,
    required this.ownerId});

  factory TokenPairDto.fromJson(Map<String, dynamic> json) =>
      _$TokenPairDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenPairDtoToJson(this);
}
