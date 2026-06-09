import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/add_amount_field.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/category_selector.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_form_fields.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class AddExpenseViewBody extends StatefulWidget {
  const AddExpenseViewBody({super.key, required this.planModel});
  final PlanModel planModel;
  @override
  State<AddExpenseViewBody> createState() => _AddExpenseViewBodyState();
}

class _AddExpenseViewBodyState extends State<AddExpenseViewBody> {
  double price = 0.00;
  String description = '';
  String date = '';
  String category = '';
  String userToken = Prefs.getString(kUserAccessToken);

  @override
  Widget build(BuildContext context) {
      String tripId = widget.planModel.value!.id!;
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

            CategorySelector(
              onCategorySelected: (String value) {
                category = value;
                log('Selected Category: $userToken');
              },
            ),
            const SizedBox(height: 24),
            DescriptionField(
              onChangedDescriptionField: (String value) {
                description = value;
              },
            ),

            SizedBox(height: 250),
            CustomButton(
              text: 'Add Expense',
              onPressed: () async {
                await BlocProvider.of<ExpenseCubit>(context).addExpense(
                  expenseEntity: ExpenseEntity(
                    description: description,
                    price: price,
                    category: category,
                  ),
                  userToken: userToken,
                  tripId: tripId,
                );
                await BlocProvider.of<ExpenseCubit>(
                  context,
                ).getExpenseHistory(tripId: tripId, userToken: userToken);
                if (mounted) Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
