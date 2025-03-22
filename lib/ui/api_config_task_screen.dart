import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/Response_model.dart';
import '../bloc/api_config/api_config_bloc.dart';
import '../bloc/api_config/api_config_contract.dart';

class ApiConfigScreen extends StatefulWidget {
  const ApiConfigScreen({super.key});

  @override
  State<ApiConfigScreen> createState() => _ApiConfigScreenState();
}

class _ApiConfigScreenState extends BaseState<ApiConfigBloc, ApiConfigScreen> {
  @override
  void initState() {
    super.initState();
    bloc.add(InitApiConfigEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text(' Api Task')),
        body: SafeArea(
            child: BlocProvider<ApiConfigBloc>(
                create: (_) => bloc,
                child: BlocBuilder<ApiConfigBloc, ApiConfigData>(
                    builder: (_, __) => _MainContent(bloc: bloc)))));
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({required this.bloc});

  final ApiConfigBloc bloc;

  @override
  Widget build(BuildContext context) {
    switch (bloc.state.state) {
      case ScreenState.content:
        return _ResponseDataView(responseModel: bloc.state.responseModel);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class _ResponseDataView extends StatelessWidget {
  final ResponseModel responseModel;

  const _ResponseDataView({required this.responseModel});

  Future<void> _launchURL() async {
    final Uri url = Uri.parse('${responseModel.url}');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('created At : ${responseModel.createdAt}'),
          Image.network(responseModel.iconUrl ?? '', height: 100),
          Text('updated At : ${responseModel.updatedAt}'),
          ElevatedButton(
              onPressed: () => _launchURL, child: const Text('See on web')),
          Text('Value : ${responseModel.value}'),
        ],
      ),
    );
  }
}
