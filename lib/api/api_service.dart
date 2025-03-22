import 'package:flutter_base_architecture_plugin/core/network/rest_api_client.dart';

import 'Response_model.dart';

class ApiService {
  final RestApiClient _apiClient;

  ApiService(this._apiClient);

  Future<ResponseModel> getApiResponse() async {
    final response =  await _apiClient.request(path: 'https://api.chucknorris.io/jokes/random',
        data: RequestData(data: null, type: RequestDataType.query),
        requestMethod: RequestMethod.get);
    return ResponseModel.fromJson(response.data);
  }

}
