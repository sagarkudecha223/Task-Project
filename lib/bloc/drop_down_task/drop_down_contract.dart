import 'package:flutter/material.dart' as material;
import 'package:flutter_base_architecture_plugin/imports/core_imports.dart';
import 'package:flutter_base_architecture_plugin/imports/dart_package_imports.dart';

part 'drop_down_contract.g.dart';

abstract class DropDownData
    implements Built<DropDownData, DropDownDataBuilder> {
  factory DropDownData([void Function(DropDownDataBuilder) updates]) =
      _$DropDownData;

  DropDownData._();

  ScreenState get state;

  List<String> get fruitList;

  List<String?> get selectedFruitList;

  List<String> get availableFruitList;

  material.TextEditingController get addFruitTextController;

  String? get errorMessage;
}

abstract class DropDownEvent {}

class InitDropDownEvent extends DropDownEvent {}

class SubmitTextEvent extends DropDownEvent {}

class DropDownSelectionEvent extends DropDownEvent {
  final String value;
  final int index;

  DropDownSelectionEvent({required this.value,required this.index});
}

class UpdateDropDownState extends DropDownEvent {
  final DropDownData state;

  UpdateDropDownState(this.state);
}
