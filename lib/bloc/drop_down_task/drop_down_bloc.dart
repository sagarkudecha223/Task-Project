import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';

import 'drop_down_contract.dart';

class DropDownBloc extends BaseBloc<DropDownEvent, DropDownData> {
  DropDownBloc() : super(initState) {
    on<InitDropDownEvent>(_initDropDownEvent);
    on<SubmitTextEvent>(_submitTextEvent);
    on<DropDownSelectionEvent>(_dropDownSelectionEvent);
    on<UpdateDropDownState>((event, emit) => emit(event.state));
  }

  static DropDownData get initState => (DropDownDataBuilder()
        ..state = ScreenState.content
        ..selectedFruitList = [null, null, null]
        ..availableFruitList = ['Apple', 'Ball', 'Cat', 'Dog']
        ..fruitList = ['Apple', 'Ball', 'Cat', 'Dog']
        ..addFruitTextController = TextEditingController()
        ..errorMessage = '')
      .build();

  void _initDropDownEvent(_, __) {}

  void _submitTextEvent(_, __) {
    final addItem = state.addFruitTextController.text;
    add(UpdateDropDownState(state.rebuild((u) => u
      ..fruitList?.add(addItem)
      ..availableFruitList?.add(addItem)
      ..addFruitTextController?.text = '')));
  }

  void _dropDownSelectionEvent(DropDownSelectionEvent event, __) {
    List<String> availableFruitList = state.fruitList
        .where((item) =>
            !state.selectedFruitList.contains(item) ||
            state.selectedFruitList[event.index] == item)
        .toList();
    add(UpdateDropDownState(state.rebuild((u) => u
      ..availableFruitList = availableFruitList
      ..selectedFruitList?[event.index] = event.value)));
  }
}
