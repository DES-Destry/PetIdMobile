import 'package:pet_id_mobile/api/common/base_controller.dart';
import 'package:pet_id_mobile/api/dto/requests/attach_pet_request.dto.dart';
import 'package:pet_id_mobile/api/dto/requests/create_pet_request.dto.dart';
import 'package:pet_id_mobile/api/dto/responses/create_pet_response.dto.dart';

import 'dto/responses/pet_response.dto.dart';
import 'dto/responses/void_response.dto.dart';

class PetController extends BaseController {
  final String _basePath = 'pet';

  Future<PetResponseDto> getPetByTagId(int tagId) async {
    final response = await get('$_basePath/tag-id/$tagId');
    return PetResponseDto.fromJson(response.data);
  }

  Future<PetResponseDto> getPetByTagCode(String code) async {
    final response = await get('$_basePath/tag-code/$code');
    return PetResponseDto.fromJson(response.data);
  }

  Future<CreatePetResponseDto> createPet(CreatePetRequestDto dto) async {
    final response = await post(_basePath, dto);
    return CreatePetResponseDto.fromJson(response.data);
  }

  Future<VoidResponseDto> attachPet(AttachPetRequestDto dto) async {
    final response = await post('$_basePath/attach', dto);
    return VoidResponseDto.fromJson(response.data);
  }
}
