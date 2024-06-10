import 'package:pet_id_mobile/api/dto/responses/check_tag.dto.dart';

import 'common/base_controller.dart';

class TagController extends BaseController {
  final String _basePath = 'tag';

  Future<CheckTagDto> checkTag(String code) async {
    final response = await get('$_basePath/code/$code');
    return CheckTagDto.fromJson(response.data);
  }
}
