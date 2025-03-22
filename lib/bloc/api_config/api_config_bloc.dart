import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:task_app/api/Response_model.dart';

import '../../api/api_service.dart';
import 'api_config_contract.dart';

class ApiConfigBloc extends BaseBloc<ApiConfigEvent, ApiConfigData> {
  ApiConfigBloc(this._apiService) : super(initState) {
    on<InitApiConfigEvent>(_initApiConfigEvent);
    on<UpdateApiConfigState>((event, emit) => emit(event.state));
  }

  final ApiService _apiService;

  static ApiConfigData get initState => (ApiConfigDataBuilder()
        ..state = ScreenState.loading
        ..responseModel = ResponseModel()
        ..errorMessage = '')
      .build();

  void _initApiConfigEvent(_, __) {
    _apiService.getApiResponse().then((value) {
      add(UpdateApiConfigState(state.rebuild((u) => u
        ..state = ScreenState.content
        ..responseModel = value)));
    });
  }
}
