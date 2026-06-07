import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/add_amount_field.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/category_selector.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/data_textfiled.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_form_fields.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class AddExpenseViewBody extends StatefulWidget {
  const AddExpenseViewBody({super.key});

  @override
  State<AddExpenseViewBody> createState() => _AddExpenseViewBodyState();
}

class _AddExpenseViewBodyState extends State<AddExpenseViewBody> {
  double price = 0.00;
  String description = '';
  String date = '';
  String category = '';
  String userToken = Prefs.getString(kUserToken);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            AddAmountField(
              onChanged: (String value) {
                price = double.tryParse(value) ?? 0.00;
              },
            ),
            const SizedBox(height: 24),
            DescriptionField(
              onChangedDescriptionField: (String value) {
                description = value;
              },
            ),
            const SizedBox(height: 24),
            CategorySelector(
              onCategorySelected: (String value) {
                category = value;
                log(
                  'Selected Category: $userToken',
                ); 
              },
            ),
            const SizedBox(height: 24),
            DateTextfiled(
              onChangedDateField: (String value) {
                date = value;
                
              },
            ),
            const SizedBox(height: 170),
            CustomButton(text: 'Add Expense', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
