import 'package:flutter_base_architecture_plugin/imports/api_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../api/api_service.dart';
import '../bloc/api_config/api_config_bloc.dart';
import '../bloc/drop_down_task/drop_down_bloc.dart';

part 'injector.g.dart';

abstract class Injector {
  static Future<bool> setup() async {
    _$Injector()._configure();
    return true;
  }

  void _configure() {
    // Configure modules here
    _registerApis();
    _registerBloc();
  }

  @Register.singleton(ApiService)
  void _registerApis();

  @Register.factory(ApiConfigBloc)
  @Register.factory(DropDownBloc)
  void _registerBloc();
}
