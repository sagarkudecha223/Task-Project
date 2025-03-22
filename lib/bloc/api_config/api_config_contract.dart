import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../../api/Response_model.dart';

part 'api_config_contract.g.dart';

abstract class ApiConfigData
    implements Built<ApiConfigData, ApiConfigDataBuilder> {
  factory ApiConfigData([void Function(ApiConfigDataBuilder) updates]) =
      _$ApiConfigData;

  ApiConfigData._();

  ScreenState get state;

  ResponseModel get responseModel;

  String? get errorMessage;
}

abstract class ApiConfigEvent {}

class InitApiConfigEvent extends ApiConfigEvent {}

class UpdateApiConfigState extends ApiConfigEvent {
  final ApiConfigData state;

  UpdateApiConfigState(this.state);
}
