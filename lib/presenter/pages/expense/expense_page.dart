import 'package:flutter/material.dart';
import 'package:onfly/presenter/pages/expense/widget/app_form_field.dart';
import 'package:onfly/presenter/widgets/app_button.dart';

import '../../../core/app_controller.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text.dart';
import '../../widgets/tab_title_widget.dart';
import 'expense_controller.dart';

class ExpensePage extends StatefulWidget {
  final Function addExpense;
  const ExpensePage({super.key, required this.addExpense});

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends AppController<ExpensePage, ExpenseController> {
  @override
  ExpenseController createController() =>
      ExpenseController(addExpense: widget.addExpense);
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
                        controller: controller.descriptionCtl,
                        labelText: "Descrição",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      AppFormField(
                          controller: controller.dateCtl,
                          datePicker: () =>
                              controller.datePicker(context: context),
                          dateInput: true,
                          labelText: "Data",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onTap: () async =>
                              controller.datePicker(context: context)),
                      AppFormField(
                        controller: controller.valueCtl,
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
                        onPressed: () => controller.addDataExpese(),
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
