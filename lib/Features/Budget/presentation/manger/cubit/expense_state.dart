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

final class GetExpenseHistoryLoading extends ExpenseState {}
final class GetExpenseHistorySuccess extends ExpenseState {
  final List<ExpenseEntity> expenses;

  const GetExpenseHistorySuccess({required this.expenses});
}
final class GetExpenseHistoryFailure extends ExpenseState {
  final String errorMessage;

  const GetExpenseHistoryFailure({required this.errorMessage});
}
