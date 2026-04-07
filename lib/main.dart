import 'package:flutter/cupertino.dart';
import 'package:payup/payup_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('pt_BR', null);

  runApp(PayupWidget());
}
