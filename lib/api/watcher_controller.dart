import 'package:pet_id_mobile/api/common/watcher_base_controller.dart';
import 'package:pet_id_mobile/api/dto/maintenance_status_response.dto.dart';

class WatcherController extends WatcherBaseController {
  Future<MaintenanceStatusResponseDto> getMaintenanceStatus() async {
    final response = await get('getMaintenanceSchedule');
    return MaintenanceStatusResponseDto.fromJson(response.data);
  }
}
