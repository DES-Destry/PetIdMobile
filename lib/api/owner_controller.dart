import 'package:pet_id_mobile/api/dto/requests/login_request.dto.dart';
import 'package:pet_id_mobile/api/dto/responses//token_pair.dto.dart';

import 'common/base_controller.dart';

class OwnerController extends BaseController {
  final String _basePath = 'owner';

  Future<String> auth() async {
    final response = await get('$_basePath/auth');
    return response.data;
  }

  Future<TokenPairDto> createOwner() async {
    final response = await post(_basePath);
    return TokenPairDto.fromJson(response.data);
  }

  Future<TokenPairDto> login(LoginRequestDto dto) async {
    final response = await post('$_basePath/login', dto);
    return TokenPairDto.fromJson(response.data);
  }
}
