import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onfly/presenter/widgets/app_button.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text.dart';
import '../../widgets/tab_title_widget.dart';
import 'expense_controller.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends AppController<ExpensePage, ExpenseController> {
  @override
  ExpenseController createController() => ExpenseController();
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TabTitleWidget(),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: const Border.fromBorderSide(
                    BorderSide(
                      color: AppColors.primary,
                      width: 0.6,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                AppText.sessionTitle('Adicionar Despesa'),
                SizedBox(height: 20),
                Form(
                  // key: _formKey,
                  child: Column(
                    children: [
                      AppFormField(
                        controller: TextEditingController(),
                        labelText: "Descrição",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      AppFormField(
                        controller: dateCtl,
                        dateInput: true,
                        labelText: "Data",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onTap: () async {
                          DateTime? date = DateTime(1900);
                          FocusScope.of(context).requestFocus(new FocusNode());

                          date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));

                          dateCtl.text = date!.toIso8601String();
                        },
                      ),
                      AppFormField(
                        controller: TextEditingController(),
                        labelText: "Valor",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.add_a_photo, size: 80)),
                      ),
                      AppButton(
                        title: "Adicionar",
                        onPressed: () {},
                        width: 1000,
                        height: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? dateInput;
  final TextInputType? keyboardType;
  final Function? onTap;

  const AppFormField({
    super.key,
    required this.labelText,
    required this.validator,
    this.dateInput,
    this.keyboardType,
    this.onTap,
    required this.controller,
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
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          onTap: () => onTap,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: (dateInput ?? false)
                ? IconButton(
                    icon: Icon(Icons.calendar_month),
                    onPressed: () {},
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
