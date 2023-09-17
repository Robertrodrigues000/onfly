import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../domain/entitites/expenses_entity.dart';

class ExpenseController extends ChangeNotifier {
  final Function addExpense;
  final ExpenseEntity? _expense;

  final expensesListListenable = ValueNotifier<ExpenseEntity?>(null);
  final fileListenable = ValueNotifier<File?>(null);
  final formKey = GlobalKey<FormState>();

  Location location = new Location();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();
  TextEditingController valueCtl = TextEditingController();
  DateTime? date = DateTime(1900);

  ExpenseController({
    required this.addExpense,
    ExpenseEntity? expense,
  }) : _expense = expense {
    _init();
  }

  void _init() {
    if (_expense != null) {
      dateCtl.text = DateFormat("dd/MM/yyyy").format(_expense!.day);
      descriptionCtl.text = _expense!.description;
      valueCtl.text = _expense!.amount.toString();
    }
  }

  Future datePicker({required context}) async {
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    dateCtl.text = DateFormat("dd/MM/yyyy").format(date!);
  }

  void addDataExpese() async {
    if (formKey.currentState!.validate()) {
      LocationData location = await _getLocation();
      addExpense(
        expense: ExpenseEntity(
            id: _expense?.id,
            description: descriptionCtl.text,
            day: (new DateFormat('dd/MM/yyyy').parse(dateCtl.text)),
            amount: _getNumber(valueCtl.text),
            latitude: location.latitude.toString(),
            longitude: location.longitude.toString(),
            file: fileListenable.value,
            ),
      );
      Modular.to.pop();
    }
  }

  double _getNumber(String number) {
    String newNumber = number.replaceAll(RegExp(r','), '.');
    newNumber = newNumber.replaceAll("R\$", "");
    return double.parse(newNumber);
  }

  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileListenable.value = File(result.files.first.path!);
    }
  }

  Future<LocationData> _getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
