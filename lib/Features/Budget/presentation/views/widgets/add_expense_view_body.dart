import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/add_amount_field.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/category_selector.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_form_fields.dart';

class AddExpenseViewBody extends StatelessWidget {
  const AddExpenseViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const AddAmountField(),
            const SizedBox(height: 24),
            const ExpenseFormFields(),
            const SizedBox(height: 24),
            const CategorySelector(),
            
          ],
        ),
      ),
    );
  }
}
