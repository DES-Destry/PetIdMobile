import 'common/base_controller.dart';

class OwnerController extends BaseController {
  final String _basePath = 'owner';

  Future<String> auth() async {
    final response = await get('$_basePath/auth');
    return response.data;
  }
}
