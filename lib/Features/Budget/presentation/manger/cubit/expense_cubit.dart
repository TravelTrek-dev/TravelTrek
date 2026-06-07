import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';
import 'package:travel_trek/Features/Budget/domain/repos/expense_repo.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit({required this.expenseRepo}) : super(ExpenseInitial());

  final ExpenseRepo expenseRepo;

  void addExpense({required ExpenseEntity expenseEntity}) async {
    emit(AddExpenseLoading());
   
    var result = await expenseRepo.addExpense(
        expenseEntity: expenseEntity,
        tripId: expenseEntity.id,
      );
    result.fold(
      (failure) => emit(AddExpenseFailure(errorMessage: failure.errorMessage)),
      (expense) => emit(AddExpenseSuccess()),
    );  
    
  }
}
