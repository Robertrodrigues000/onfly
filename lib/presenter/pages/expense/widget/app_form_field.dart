import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? dateInput;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function()? datePicker;

  const AppFormField({
    super.key,
    required this.labelText,
    required this.validator,
    this.dateInput,
    this.keyboardType,
    this.onTap,
    required this.controller,
    this.datePicker,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(50.0),
        elevation: 5,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: keyboardType == TextInputType.number
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  CurrencyInputFormatter(),
                ]
              : null,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: (dateInput ?? false)
                ? IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: datePicker,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "pt_Br");

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
