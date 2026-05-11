import 'package:flutter/material.dart';

class ClientFormController {
  TextEditingController valueController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController contactNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cnpjController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isConcurrentLevy = false;

  List<String> typeLevyOptions = ['Mensal', 'Semanal'];

  String selectedTypeLevy = 'Mensal';

  void setSelectedTypeLevy(String? value) {
    if (value != null && typeLevyOptions.contains(value)) {
      selectedTypeLevy = value;
    }
  }

  void toggleConcurrentLevy(bool value) {
    isConcurrentLevy = value;
  }

  void dispose() {
    valueController.dispose();
    dateController.dispose();
    clientNameController.dispose();
    contactNameController.dispose();
    phoneController.dispose();
    cnpjController.dispose();
    addressController.dispose();
  }
}
