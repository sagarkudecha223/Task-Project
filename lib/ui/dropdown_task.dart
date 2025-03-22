import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

import '../bloc/drop_down_task/drop_down_bloc.dart';
import '../bloc/drop_down_task/drop_down_contract.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key});

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

class _DropDownScreenState extends BaseState<DropDownBloc, DropDownScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text(' Dropdown Task')),
        body: SafeArea(
            child: BlocProvider<DropDownBloc>(
                create: (_) => bloc,
                child: BlocBuilder<DropDownBloc, DropDownData>(
                    builder: (_, __) => _MainContent(bloc: bloc)))));
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({required this.bloc});

  final DropDownBloc bloc;

  @override
  Widget build(BuildContext context) {
    switch (bloc.state.state) {
      case ScreenState.content:
        return _ScreenContent(bloc: bloc);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class _ScreenContent extends StatelessWidget {
  final DropDownBloc bloc;

  const _ScreenContent({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: bloc.state.addFruitTextController,
            decoration: const InputDecoration(hintText: 'Add fruit'),
            onSubmitted: (value) => bloc.add(SubmitTextEvent()),
          ),
          const SizedBox(height: 20),
          _ListView(bloc: bloc)
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final DropDownBloc bloc;

  const _ListView({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<String> availableFruitList = bloc.state.fruitList
              .where((item) =>
                  !bloc.state.selectedFruitList.contains(item) ||
                  bloc.state.selectedFruitList[index] == item)
              .toList();
          return DropdownButton<String?>(
            value: bloc.state.selectedFruitList[index],
            hint: const Text("Select Fruit"),
            isExpanded: true,
            onChanged: (value) => bloc
                .add(DropDownSelectionEvent(value: value ?? '', index: index)),
            items: availableFruitList.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<String> fruitList = ['Apple', 'Ball', 'Cat', 'Dog'];
  List<String?> selectedFruitList = [null, null, null];

  void updateAvailableFruits() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dynamic List Selection")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: selectedFruitList.length,
                itemBuilder: (context, index) {
                  List<String> availableFruitList = fruitList
                      .where((item) =>
                          !selectedFruitList.contains(item) ||
                          selectedFruitList[index] == item)
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: DropdownButton<String?>(
                      value: selectedFruitList[index],
                      hint: Text("Select Fruit"),
                      isExpanded: true,
                      onChanged: (newValue) {
                        setState(() {
                          selectedFruitList[index] = newValue;
                        });
                        updateAvailableFruits();
                      },
                      items: availableFruitList.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
