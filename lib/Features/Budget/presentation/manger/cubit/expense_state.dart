part of 'expense_cubit.dart';

sealed class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

final class ExpenseInitial extends ExpenseState {}

final class AddExpenseLoading extends ExpenseState {}

final class AddExpenseSuccess extends ExpenseState {}

final class AddExpenseFailure extends ExpenseState {
  final String errorMessage;

  const AddExpenseFailure({required this.errorMessage});
}
