import 'common/base_controller.dart';

class ServerController extends BaseController {
  Future<bool> health() async {
    final response = await get('health');
    return response.data == 'Healthy';
  }
}
